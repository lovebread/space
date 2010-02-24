Iyxzone = {};

Object.extend(Iyxzone, {

  version: 1.0,

  author: ['高侠鸿'],

  // some utilities
  disableButton: function(button, text){
    button.writeAttribute({disabled: 'disabled'});
    this.background = button.style.background;
    button.setStyle({
      background: 'grey',
      opacity: 0.5
    });
    button.value = text;
  },

  enableButton: function(button, text){
    button.disabled = '';
    button.setStyle({
      background: this.background,
      opacity: 1
    });
    button.value = text;
  },

  countLength: function(str){
    var escapedStr = encodeURIComponent(str);
    if(escapedStr.indexOf("%") != -1) {
      var count = escapedStr.split("%").length - 1;
      if(count == 0)
        count++  //perverse case; can't happen with real UTF-8
      var tmp = escapedStr.length - (count * 3);
      count = count + tmp;
    }else {
      count = escapedStr.length;
    }
  },

  limitText: function(el, max, count_div){
    var count = this.countLength(el.value);
    if(count > max){
      el.value = el.value.substring(0, max);
      return false;
    }
    $(count_div).innerHTML = el.value.length + "/" + max;
  },

  validationCode: function(digits){
    var codes = new Array(digits);       //用于存储随机验证码
    var colors = new Array("Red","Green","Gray","Blue","Maroon","Aqua","Fuchsia","Lime","Olive","Silver");
    for(var i=0;i < codes.length;i++){//获取随机验证码
      codes[i] = Math.floor(Math.random()*10);
    }
    var div = new Element('div');
    for(var i = 0;i < codes.length;i++){
      var span = new Element('span');
      span.innerHTML = codes[i];
      span.setStyle({color: colors[Math.floor(Math.random()*10)]});
      div.appendChild(span);
    }
    return {codes: codes, div: div};
  },


});

