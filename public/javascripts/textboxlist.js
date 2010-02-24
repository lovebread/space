ResizableTextBox = Class.create({

  initialize: function(element, options){
    this.options = Object.extend({
      min: 20,
      max: 500,
      step: 7,
    }, options || {});
    this.element = element;
    this.element.setStyle({width: this.options.min});

    Event.observe(this.element, 'keyup', function(){
      var newSize = this.options.step * this.element.value.length;
      if(newSize >= this.options.max)
	      newSize = this.options.max;
      else if(newSize <= this.options.min)
	      newSize = this.options.min;
      else
	      newSize = newSize;
      this.element.setStyle({width: newSize + 'px'});
    }.bind(this));
      
  },

  reset: function(){
    this.element.setStyle({width: this.options.min + 'px'});
  }

});

//   keyup => observe left, right, backspace
//   click => fire onblur event
TextBoxList = Class.create({

  initialize: function(element, options){
    this.options = Object.extend({
      /*
       * holder css class name
       */
      holderClassName: 'holder',
      /*
       * box css class name
       */
      bitClassName: 'bit-box',
      /*
       * parameter name
       */
      paramName: 'value[]',
      /*
       * callback executed when main input is focused
       * parameters: main input field
       */
      onMainInputFocus: Prototype.emptyFunction,
      /*
       * callback executed when main input loses focus
       * parameter: main input field
       */
      onMainInputBlur: Prototype.emptyFunction,
      /*
       * callback executed when a box is focused
       * parameter: box element
       */
      onBoxFocus: Prototype.emptyFunction,
      /*
       * callback executed when a box loses focus
       * parameter: box element
       */
      onBoxBlur: Prototype.emptyFunction,
      /*
       * callback executed when a box is removed
       * parameter: box element, text
       */
      onBoxDispose: Prototype.emptyFunction
    }, options || {});

    /*
     * how many boxes are there?
     */
    this.count = 0;
    
    /*
     * original element
     */
    this.el = $(element);

    /*
     * box values: box_id => box_value(maybe user_id, email, etc)
     */
    this.bits = new Hash();

    /*
     * currently focused box
     */
    this.current = false;

    /*
     * main input field
     */
    this.mainInput = this.createMainInput();

    /*
     * root element which contains all related elements
     */
    this.holder = new Element('ul', {class: this.options.holderClassName});
    
    this.el.hide();
    this.holder.appendChild(this.mainInput);
    Element.insert(this.el, {before: this.holder});

    /*
     * make main input resizable
     */
    this.resizableMainInput = new ResizableTextBox(this.inputTextField, {max: this.holder.getWidth()});

    /*
     * observe click event of main input field
     */
    Event.observe(this.mainInput, 'click', function(e){
      this.mainInputFocus();
      Event.stop(e);
    }.bind(this));

    /*
     * observe click event of holder
     */
    Event.observe(this.holder, 'click', function(e){
      this.inputTextField.focus();
      this.mainInputFocus();
      Event.stop(e);
    }.bind(this));
  
    /*
     * observe keyboard event
     */
    Event.observe(document, 'keydown', function(e){
      
    }.bind(this));

    Event.observe(document, 'keyup', function(e){
      switch(e.keyCode){
        case 37:
          /*
	         * when left key is pressed
	         * return if no box is selected
	         * otherwise focus on previous box
	         */
          if(!this.current || this.current == this.mainInput) return;
          this.boxFocus(this.getPrevious(this.current));
          break;  
        case 39: 
	        /*
	         * when right key is pressed
	         * return if no box is selected
	         * otherwise focus on next box
	         */
          if(!this.current || this.current == this.mainInput) return;
          this.boxFocus(this.getNext(this.current));
          break;
        case 8:
          if(!this.current || this.current == this.mainInput) return;
          this.dispose(this.current, e.keyCode);
          break;
        case 46:
          if(!this.current || this.current == this.mainInput) return;
          this.dispose(this.current, e.keyCode);
          break;
      }
    }.bind(this));

    /*
     * observe click event
     * no box is selected if this happens
     */
    Event.observe(document, 'click', function(e){
      this.boxBlur();
    }.bind(this));
  },

  add: function(val, text){
    /*
     * create box and insert it to the bottom of box list (before main input)
     */
    var id= 'bit-' + this.count++;
    var el = this.createBox(text, {id: id});
    Element.insert(this.mainInput, {before: el});
    
    /*
     * create input and insert it before box element created in previous step
     */
    var input = this.createInput({value: val});
    Element.insert(el, {before: input});
    input.hide();

    /*
     * observe click events generated by box
     */
    Event.observe(el, 'click', function(e){
      this.boxFocus(el);
      Event.stop(e);
    }.bind(this));

    
    this.bits.set(id, text);

    /*
     * reset resizable text field
     */
    this.resizableMainInput.reset(); 
    
    return el; 
  },

  createBox: function(text, options){
    /*
     * create li element and delete button
     */
    var li = new Element('li', Object.extend({class: this.options.bitClassName}, options || {}));
    var a = new Element('a');
    var span = new Element('span').update(text);
    var em = new Element('em', {class: 'x'});
    span.appendChild(em);
    a.appendChild(span);
    li.appendChild(a);

    /*
     * observe remove event
     */
    Event.observe(em, 'click', function(e){
      this.dispose(e.element().up().up().up());
      Event.stop(e);
    }.bind(this));
    
    return li;
  },

  createMainInput: function(){
    var li = new Element('li', {width: '100%'});//, {class: this.options.bitClassName});
    var el = new Element('input', {type: 'text'}); //Object.extend({type: 'text', name: this.options.paramName}, options || {}));
    li.appendChild(el);
    this.inputTextField = el;
    return li;
  },

  createInput: function(options){
    var li = new Element('li', {class: this.options.bitClassName});
    var el = new Element('input', Object.extend({type: 'text', name: this.options.paramName}, options || {}));
    li.appendChild(el);
    return li;
  },

  mainInputFocus: function(){
    /*
     * nothing to do if we already focus on main input
     */
    if(this.mainInput == this.current)
      return;
    
    /*
     * fire blur event if we previously focus on one box
     * otherwise return
     */
    if(this.current){
      this.boxBlur();
    }

    this.current = this.mainInput;
    
    /*
     * invoke callbacks
     */
    this.options.onMainInputFocus(this.getMainInput());
  },

  /*
   * main input blur
   */
  mainInputBlur: function(){
    /*
     * return if main input doesn't own focus
     */
    if(this.current == this.mainInput){
      this.current = false;
      this.options.onMainInputBlur(this.getMainInput());
    }
  },

  /*
   * focus on a box
   */
  boxFocus: function(el){
    /*
     * return if el has already got focus
     */
    if(this.current == el)
      return;

    /*
     * if we previously focused on main input, then no box needs to be deselected
     * otherwise 
     */
    if(this.current == this.mainInput){
      this.mainInputBlur();
    }else if(this.current){
      this.boxBlur(this.current);
    }

    el.addClassName('bit-focus');
    this.current = el;
    
    // invoke callbacks
    this.options.onBoxFocus(el);
  },

  boxBlur: function(){
    /*
     * if currently focused box is not main input, deselect that bos
     */
    if(this.current && this.mainInput != this.current)
      this.current.className = this.options.bitClassName;

    this.current = false; 

    /*
     * invoke callbacks
     */
    this.options.onBoxBlur(this.current);
  },

  /*
   * return previous box
   * if current box is the earliest box, return the box itself
   * note that each box is some html like:
   * <li><input></li>
   * <li><a/></li>
   * thus, previous().previous() is required to achieve previous box
   */
  getPrevious: function(el){
    if(el.previous().previous() == null)
      return el;
    else
      return el.previous().previous();
  },

  getNext: function(el){
    if(el.next() == this.mainInput)
      return el;
    else
      return el.next().next();
  },

  dispose: function(el, keyCode){
    var del = null;

    /*
     * remove box in 3 different ways:
     * 1. delete link in each box
     * 2. backspace/delete selected box
     * 3. backspace when focusing on main input
     */
    if(keyCode == null){
      /*
       * if el is current box, reset current box first
       */
      if(this.current == el)
	      this.current = false;
      
      del = el;
    }else{
      /*
       * return if nothing catches focus
       * if it's case 2, box to remove is current box
       * if it's case 3, box to remove is the box just before main input
       */
      if(!this.current)
	      return;

      if(this.current != this.mainInput){
	      del = this.current;
	      this.current = false;
      }else if(this.getMainInput().value == ''){
	      if(this.mainInput.previous() == null)
	        return;
	      else
	        el = this.mainInput.previous();
      }
    }

    /*
     * first remove small input field tag
     * then call user callback
     * finally remove box 
     */
    this.bits.unset(el.id);
    this.options.onBoxDispose(el, el.previous().childElements()[0]);
    if(el.previous()){
      el.previous().remove();
    }
    el.remove();
  },

  disposeAll: function(){
    this.bits.each(function(pair){
      this.dispose($(pair.key), null);
    }.bind(this));
    this.bits = new Hash();
  },

  getMainInput: function(){
    return this.inputTextField;
  },

  getValues: function(){
    var inputs = $$('input');
    var values = [];
    for(var i=0;i<inputs.length;i++){
      if(inputs[i].type == 'text' && inputs[i].hasClassName('smallInput')){
        values.push(inputs[i].value);
      }
    }
    return values;
  }

});
