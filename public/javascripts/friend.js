//好友
Iyxzone.Friend = {
  version: '1.0',
  author: ['高侠鸿'],
  Suggestor: {},
	NicerSuggestor: {}, //for layout reason
  Tagger: Class.create({}) // only used in Blog or Video
};


//战友
Iyxzone.Comrade = {
  version: '1.0',
  author: ['高侠鸿'],
  Suggestor: {}
};

Object.extend(Iyxzone.Friend.Suggestor, {

  newSuggestion: function(suggestionID, token){
    // consturct except parameters
    var url = 'friend_suggestions/new';
    var exceptIDs = [];
    var suggestions = $('friend_suggestions').childElements();
    for(var i=0;i<suggestions.length;i++){
      exceptIDs.push(suggestions[i].readAttribute('suggestion_id'));
    }
    var exceptParam = "";
    for(var i=0;i<exceptIDs.length;i++){
      exceptParam += "except_ids[]=" + exceptIDs[i] + "&";
    }
    
    // construct url
    url += "?" + exceptParam;
    
    // send ajax request
    new Ajax.Request(url, {
      method: 'get',
      parameters: {authenticity_token: encodeURIComponent(token)}, //encodeURIComponent(token)},
      onSuccess: function(transport){
        var card = $('friend_suggestion_' + suggestionID);
        var temp_parent = new Element('div');
        temp_parent.innerHTML = transport.responseText;
        var li = temp_parent.childElements()[0];
        li.hide();
        Element.replace(card, li);
        li.appear({duration: 3.0});
      }.bind(this)
    });
  }

});

Object.extend(Iyxzone.Friend.NicerSuggestor, {

  newSuggestion: function(suggestionID, token){
    // consturct except parameters
    var url = 'friend_suggestions/new';
    var exceptIDs = [];
    var suggestions = $('friend_suggestions').childElements();
    for(var i=0;i<suggestions.length;i++){
      exceptIDs.push(suggestions[i].readAttribute('suggestion_id'));
    }
    var exceptParam = "";
    for(var i=0;i<exceptIDs.length;i++){
      exceptParam += "except_ids[]=" + exceptIDs[i] + "&";
    }
    
    // construct url
    url += "?" + exceptParam;
    
    // send ajax request
    new Ajax.Request(url, {
      method: 'get',
      parameters: {authenticity_token: encodeURIComponent(token), nicer: 1}, //encodeURIComponent(token)},
      onSuccess: function(transport){
        var card = $('friend_suggestion_' + suggestionID);
        var temp_parent = new Element('div');
        temp_parent.innerHTML = transport.responseText;
        var li = temp_parent.childElements()[0];
        li.hide();
        Element.replace(card, li);
        li.appear({duration: 3.0});
      }.bind(this)
    });
  }

});

Object.extend(Iyxzone.Comrade.Suggestor, {

  newSuggestion: function(serverID, suggestionID, token){
    // construct except parameters
    var url = 'friend_suggestions/new';
    var exceptIDs = [];
    var suggestions = $('server_' + serverID + '_suggestions').childElements();
    for(var i=0;i<suggestions.length;i++){
      exceptIDs.push(suggestions[i].readAttribute('suggestion_id'));
    }
    var exceptParam = "";
    for(var i=0;i<exceptIDs.length;i++){
      exceptParam += "except_ids[]=" + exceptIDs[i] + "&";
    }

    // construct url
    url += "?" + exceptParam;

    // send ajax request
    new Ajax.Request(url, {
      method: 'get',
      parameters: {server_id: serverID, authenticity_token: encodeURIComponent(token)}, //encodeURIComponent(token)},
      onSuccess: function(transport){
        var card = $('comrade_suggestion_' + suggestionID);
        var temp_parent = new Element('div');
        temp_parent.innerHTML = transport.responseText;
        var li = temp_parent.childElements()[0];
        li.hide();
        Element.replace(card, li);
        li.appear({duration: 3.0});
      }.bind(this)
    });

  }

});

Iyxzone.Friend.Autocompleter = Class.create(Autocompleter.Base, {

  initialize: function(element, update, url, options) {
    this.baseInitialize(element, update, options);
    this.options.asynchronous  = true;
    this.options.onComplete    = this.onComplete.bind(this);
    this.options.defaultParams = this.options.parameters || null;
    this.url                   = url;
    this.comp = this.options.comp; //位置的参照物，默认是以this.element为参照物
    this.emptyText = this.options.emptyText || "没有匹配的..."
    Event.observe(element, 'focus', this.onInputFocus.bindAsEventListener(this));
  },

  onInputFocus: function(e){
    this.options.onInputFocus(this.element);
  },

  getUpdatedChoices: function() {
    this.startIndicator();

    var entry = encodeURIComponent(this.options.paramName) + '=' + encodeURIComponent(this.getToken());

    this.options.parameters = this.options.callback ? this.options.callback(this.element, entry) : entry;

    if(this.options.defaultParams)
      this.options.parameters += '&' + this.options.defaultParams;

    this.options.parameters += '&friend[login]=' + this.element.value;

    new Ajax.Request(this.url, this.options);
  },

  onComplete: function(request) {
    if(request.responseText.indexOf('li') < 0){
      this.update.innerHTML = this.options.emptyText;
    }else{
      this.updateChoices(request.responseText);
    }
    if(this.comp){
      this.update.setStyle({
        position: 'absolute',
        left: this.comp.positionedOffset().left + 'px',
        top: (this.comp.positionedOffset().top + this.comp.getHeight()) + 'px',
        width: (this.comp.getWidth() - 10) + 'px',
        maxHeight: '200px',
        overflow: 'auto',
        padding: '5px',
        background: 'white',
        border: '1px solid #E7F0E0'
      });
    }
  }

});

Iyxzone.Friend.Tagger = Class.create({
 
  initialize: function(max, friendIDs, tagIDs, friendNames, toggleButton, input, friendList, friendTable, friendItems, gameSelector, confirmButton, cancelButton){
    this.max = max;
    this.tags = new Hash(); // friendID => [tagIDs, div]
    this.newTags = new Hash(); // friendID => div
    this.delTags = new Array();
    this.checkedFriends = new Hash(); // friendID 
    this.toggleButton = $(toggleButton);
    this.friendList = $(friendList);
    this.friendTable = $(friendTable);
    this.friendItems = $(friendItems);
    this.confirmButton = $(confirmButton);
    this.cancelButton = $(cancelButton);
    this.gameSelector = $(gameSelector);

    // set text box list
    this.taggedUserList = new TextBoxList(input, {
      onBoxDispose: this.removeBox.bind(this),
      holderClassName: 'friend-select-list s_clear',
      bitClassName: ''
    });

    for(var i=0;i<friendIDs.length;i++){
      var el = this.taggedUserList.add(friendIDs[i], friendNames[i]);
      this.tags.set(friendIDs[i], [tagIDs[i], el]);
    }

    var inputs = $$('input');
    for(var i=0;i<inputs.length;i++){
      if(inputs[i].type == 'checkbox'){
        inputs[i].checked = false;
        inputs[i].observe('click', this.onSelectFriend.bindAsEventListener(this));
        if(this.tags.keys().include(inputs[i].value)){
          inputs[i].checked = true;
          this.checkedFriends.set(inputs[i].value, {id: inputs[i].value, login: inputs[i].readAttribute('login'), profileID: inputs[i].readAttribute('profile_id')});
        }
      }
    }

    // toggle button event
    Event.observe(this.toggleButton, 'click', function(e){
      this.toggleFriends();
    }.bind(this));

    // confirm button event
    Event.observe(this.confirmButton, 'click', function(event){
      Event.stop(event);
      
      var checked = this.checkedFriends.keys();
      var delTags = new Array();
      var newTags = new Array();
      this.tags.keys().each(function(key){
        if(!checked.include(key)){
          delTags.push(key);
        }
      }.bind(this));
      
      this.newTags.keys().each(function(key){
        if(!checked.include(key)){
          delTags.push(key);
        }
      }.bind(this));

      this.removeTags(delTags);

      var tagIDs = this.tags.keys();
      var newTagIDs = this.newTags.keys();
      this.checkedFriends.each(function(pair){
        var input = pair.value;
        var key = pair.key;
        if(!tagIDs.include(key) && !newTagIDs.include(key)){
          newTags.push(input);
        }
      }.bind(this));
      
      this.addTags(newTags);

      this.toggleFriends();
    }.bind(this));
    
    // cancel button events
    Event.observe(this.cancelButton, 'click', function(event){
      Event.stop(event);
      this.toggleFriends();
    }.bind(this));

    // game selector event
    Event.observe(this.gameSelector, 'change', function(e){
      this.getFriends(this.gameSelector.value);
    }.bind(this)); 

    // custom auto completer
    new Iyxzone.Friend.Autocompleter(this.taggedUserList.getMainInput(), this.friendList, '/auto_complete_for_friend_tags', {
      method: 'get',
      emptyText: '没有匹配的好友...',
      afterUpdateElement: this.afterSelectFriend.bind(this),
      onInputFocus: this.showTips.bind(this),
      comp: this.taggedUserList.holder,
      onLoading: this.searching.bind(this),
    });
  },

  searching: function(){
    this.friendList.innerHTML = '正在搜索你的好友...';
    this.friendList.setStyle({
      position: 'absolute',
      left: this.taggedUserList.holder.positionedOffset().left + 'px',
      top: (this.taggedUserList.holder.positionedOffset().top + this.taggedUserList.holder.getHeight()) + 'px',
      width: (this.taggedUserList.holder.getWidth() - 10) + 'px',
      maxHeight: '200px',
      overflow: 'auto',
      padding: '5px',
      background: 'white',
      border: '1px solid #E7F0E0'
    });
    this.friendList.show();
  },

  showTips: function(){
    this.friendList.innerHTML = '输入你好友的拼音';
    this.friendList.setStyle({
      position: 'absolute',
      left: this.taggedUserList.holder.positionedOffset().left + 'px',
      top: (this.taggedUserList.holder.positionedOffset().top + this.taggedUserList.holder.getHeight()) + 'px',
      width: (this.taggedUserList.holder.getWidth() - 10) + 'px',
      maxHeight: '200px',
      overflow: 'auto',
      padding: '5px',
      background: 'white',
      border: '1px solid #E7F0E0'
    });
    this.friendList.show();
  }, 

  removeBox: function(el, input){
    var friendID = input.value;
  
    var tagInfo = this.tags.unset(friendID);
    
    if(tagInfo){
      // remove exsiting tag
      this.delTags.push(tagInfo[0]);
    }else{
      // remove new tag
      this.newTags.unset(friendID);
    }

    // uncheck boxes
    this.checkedFriends.unset(friendID);
    var inputs = $$('input');
    for(var i=0;i<inputs.length;i++){
      if(inputs[i].type == 'checkbox' && inputs[i].value == friendID){
        inputs[i].checked = false;
      }
    }
  },

  removeTags: function(friendIDs){
    for(var i=0;i<friendIDs.length;i++){
      var friendID = friendIDs[i];
      var tagInfo = this.tags.unset(friendID);
      if(tagInfo){
        // remove exsiting tag
        this.delTags.push(tagInfo[0]);
        tagInfo[1].remove();
      }else{
        // remove new tag
        var div = this.newTags.unset(friendID);
        div.remove();
      }
    }
  },

  addTags: function(friends){
    if(friends.length == 0)
      return;
    
    for(var i=0;i<friends.length;i++){
      var el = this.taggedUserList.add(friends[i].id, friends[i].login);
      this.newTags.set(friends[i].id, el);
    }
  },

  getNewTags: function(){
    return this.newTags.keys();
  },

  getDelTags: function(){
    return this.delTags;
  },

  getFriends: function(game_id){
    this.friendItems.innerHTML = '<img src="/images/loading.gif" style="text-align:center"/>';
    new Ajax.Request('/user/friend_tags/new?game_id=' + game_id, {
      method: 'get',
      onSuccess: function(transport){
        this.friendItems.innerHTML = transport.responseText;
        var inputs = $$('input');
        for(var i = 0; i < inputs.length; i++){
          if(inputs[i].type == 'checkbox'){
            inputs[i].observe('click', this.onSelectFriend.bindAsEventListener(this));
            if(this.checkedFriends.keys().include(inputs[i].value)){
              inputs[i].checked = true;
            }
          }
        }
      }.bind(this)
    });
  },

  toggleFriends: function(){
    if(!this.friendTable.visible()){
      var pos = this.toggleButton.positionedOffset();
      this.friendTable.setStyle({
        position: 'absolute',
        left: (pos.left + this.toggleButton.getWidth() - this.friendTable.getWidth()) + 'px',
        top: (pos.top + this.toggleButton.getHeight()) + 'px'
      });
      this.friendTable.show();
    }else{
      this.friendTable.hide();
    }
  },

  afterSelectFriend: function(input, selectedLI){
    var id = selectedLI.readAttribute('id');
    var profileID = selectedLI.readAttribute('profileID');
    var login = selectedLI.childElements()[0].innerHTML;
    input.clear();

    if(this.tags.keys().include(id) || this.newTags.keys().include(id)){
      return;
    }else{
      if(this.tags.keys().length + this.newTags.keys().length >= this.max){
        error('最多选' + this.max + '个!');
        return;
      }

      this.addTags([{id: id, profileID: profileID, login: login}]);
      this.checkedFriends.set(id, {id: id, profileID: profileID, login: login});
      input.clear();
      
      var inputs = $$('input');
      for(var i = 0; i < inputs.length; i++){
        if(inputs[i].type == 'checkbox' && inputs[i].value == id){
          inputs[i].checked = true;
        }
      }
    }
  },

  onSelectFriend: function(mouseEvent){
    var checkbox = mouseEvent.target;
    
    if(!checkbox.checked){
      this.checkedFriends.unset(checkbox.value);
      return;
    }
 
    if(this.checkedFriends.keys().length >= this.max){
      error('最多选' + this.max + '个!');
      checkbox.checked = false;
      return;
    }

    this.checkedFriends.set(checkbox.value, {id: checkbox.value, login: checkbox.readAttribute('login'), profileID: checkbox.readAttribute('profile_id')}); 
  },

  reset: function(tagInfos){
    // move new tags to tags
    this.newTags.each(function(pair){
      var friendID = pair.key;
      var div = pair.value;
      for(var i = 0; i < tagInfos.length; i++){
        if(tagInfos[i].friend_id == friendID){
          this.tags.set(friendID, [tagInfos[i].id, div])
        }
      }
    }.bind(this));

    // reset del tags
    this.delTags = new Array();
    this.newTags = new Hash();
  }

});
