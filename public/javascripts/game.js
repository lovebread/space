Iyxzone.Game = {
  version: '1.0',

  author: ['高侠鸿'],

  Suggestor: {},

  Selector: Class.create({}),

  PinyinSelector: Class.create({}),

  Feeder: {}
};

Iyxzone.Game.Selector = Class.create({

  details: new Hash(),

  initialize: function(gameSelectorID, areaSelectorID, serverSelectID, raceSelectorID, professionSelectorID, gameDetails, options){
    this.gameSelectorID = gameSelectorID;
    this.areaSelectorID = areaSelectorID;
    this.serverSelectID = serverSelectID;
    this.raceSelectorID = raceSelectorID;
    this.professionSelectorID = professionSelectorID;
    this.details = gameDetails;
 
    this.options = Object.extend({
      onGameChange: Prototype.emptyFunction,
      onAreaChange: Prototype.emptyFunction,
      onServerChange: Prototype.emptyFunction,
      onRaceChange: Prototype.emptyFunction,
      onProfessionChange: Prototype.emptyFunction
    }, options || {});

    this.setEvents();
  },

  setEvents: function(){
    if(this.gameSelectorID)
      Event.observe(this.gameSelectorID, 'change', this.gameChange.bind(this));

    if(this.areaSelectorID)
      Event.observe(this.areaSelectorID, 'change', this.areaChange.bind(this));
    
    if(this.serverSelectID)
      Event.observe(this.serverSelectID, 'change', this.serverChange.bind(this));

    if(this.raceSelectorID)
      Event.observe(this.raceSelectorID, 'change', this.raceChange.bind(this));

    if(this.professionSelectorID)
      Event.observe(this.professionSelectorID, 'change', this.professionChange.bind(this));
  },

  resetGameInfo: function(){
      $(this.gameSelectorID).value = '';
  },

  resetAreaInfo: function(){
    if($(this.areaSelectorID))
      $(this.areaSelectorID).innerHTML = '<option value="">---</option>';
  },

  setupAreaInfo: function(areas){
    var html = '<option value="">---</option>';
    for(var i=0;i<areas.length;i++){
      html += "<option value='" + areas[i].id + "'>" + areas[i].name + "</option>";
    }
    $(this.areaSelectorID).innerHTML = html;
  },

  resetServerInfo: function(){
    $(this.serverSelectID).innerHTML = '<option value="">---</option>';
  },

  setupServerInfo: function(servers){
    var html = '<option value="">---</option>';
    for(var i=0;i<servers.length;i++){
      html += "<option value='" + servers[i].id + "'>" + servers[i].name + "</option>";
    }
    $(this.serverSelectID).innerHTML = html;
  },

  resetProfessionInfo: function(){
      $(this.professionSelectorID).innerHTML = '<option value="">---</option>';
  },

  setupProfessionInfo: function(professions){
    var html = '<option value="">---</option>';
    for(var i=0;i<professions.length;i++){
      html += "<option value='" + professions[i].id + "'>" + professions[i].name + "</option>";
    }
    $(this.professionSelectorID).innerHTML = html;
  },

  resetRaceInfo: function(){
    $(this.raceSelectorID).innerHTML = '<option value="">---</option>';
  },

  setupRaceInfo: function(races){
    var html = '<option value="">---</option>';
    for(var i=0;i<races.length;i++){
      html += "<option value='" + races[i].id + "'>" + races[i].name + "</option>";
    }
    $(this.raceSelectorID).innerHTML = html;
  },

  gameChange: function(){
    if(this.gameSelectorID && $(this.gameSelectorID).value == ''){
      this.reset();
      return;
    }
    new Ajax.Request('/game_details?game_id=' + $(this.gameSelectorID).value, {
      method: 'get',
      onSuccess: function(transport){
        this.details = transport.responseText.evalJSON().game;
        // reset all details if exists
        if(this.areaSelectorID)
          this.resetAreaInfo();
        if(this.serverSelectID)
          this.resetServerInfo();
        if(this.raceSelectorID)
          this.resetRaceInfo();
        if(this.professionSelectorID)
          this.resetProfessionInfo();
    
        // set all informations
        if(!this.details.no_areas){
          this.setupAreaInfo(this.details.areas);
        }else{
          this.setupServerInfo(this.details.servers);
        }
        if(!this.details.no_professions && this.professionSelectorID)
          this.setupProfessionInfo(this.details.professions);
        if(!this.details.no_races && this.raceSelectorID)
          this.setupRaceInfo(this.details.races);
        
        this.options.onGameChange($(this.gameSelectorID).value);
      }.bind(this)
    });
  },

  areaChange: function(){
    if(this.areaSelectorID && $(this.areaSelectorID).value == ''){
      if(this.serverSelectID)
        this.resetServerInfo();
      return;
    }
    new Ajax.Request('/area_details?game_id=' + $(this.gameSelectorID).value + '&area_id=' + $(this.areaSelectorID).value, {
      method: 'get',
      onSuccess: function(transport){
        var areaInfo = transport.responseText.evalJSON().game_area;

        if(this.serverSelectID)
          this.setupServerInfo(areaInfo.servers);

        this.options.onAreaChange($(this.areaSelectorID).value);
      }.bind(this)
    });
  },

  serverChange: function(){
    if(this.serverSelectID && $(this.serverSelectID).value == ''){
      return;
    }
    this.options.onServerChange($(this.serverSelectID).value);
  },

  raceChange: function(){
    if(this.raceSelectorID && $(this.raceSelectorID).value == ''){
      return;
    }
    this.options.onRaceChange($(this.raceSelectorID).value);
  },

  professionChange: function(){
    if(this.professionSelectorID && $(this.professionSelectorID).value == ''){
      return;
    }
    this.options.onProfessionChange($(this.professionSelectorID).value);
  },

  reset: function(){
    this.resetGameInfo();
    if(this.areaSelectorID)
      this.resetAreaInfo();
    if(this.serverSelectID)
      this.resetServerInfo();
    if(this.professionSelectorID)
      this.resetProfessionInfo();
    if(this.raceSelectorID)
      this.resetRaceInfo();
    this.details = null;
  },

  getDetails: function(){
    return this.details;
  }

});

Iyxzone.Game.PinyinSelector = Class.create(Iyxzone.Game.Selector, {

  initialize: function($super, pinyins, gameSelectorID, areaSelectorID, serverSelectID, raceSelectorID, professionSelectorID, options){
    this.pinyins = pinyins;
    this.mappings = new Hash();
    this.keyPressed = '';
    this.lastPressedAt = null;
    this.currentGameID = null;
    
    // save start position of each letter: a-z A-Z 
    var i=0;
    for(var i=0;i<26;i++){
      var code = 97 + i;
      var j = this.binarySearch(code);
      if(j != -1){
        this.mappings.set(code, j); //lower case
        this.mappings.set(code - 32, j); //upper case
      }
    }

    $super(gameSelectorID, areaSelectorID, serverSelectID, raceSelectorID, professionSelectorID, options);
  },

  setEvents: function($super){
    $super();

    Event.observe($(this.gameSelectorID), 'keyup', function(e){
      Event.stop(e);
      this.onKeyUp(e);
    }.bind(this));

    Event.observe($(this.gameSelectorID), 'blur', function(e){
      this.lastPressedAt = null;
      this.keyPressed = '';
    }.bind(this));      
  },

  binarySearch: function(keyCode){
    var size = this.pinyins.length;
    var i = 0;
    var j = size - 1;
    var c1 = this.pinyins[i].toLowerCase().charCodeAt(0);
    var c2 = this.pinyins[j].toLowerCase().charCodeAt(0);
    if(c1 > keyCode) return -1;
    if(c2 < keyCode) return -1;
    while(i != j-1){
      var m = Math.ceil((i+j)/2);
      var c = this.pinyins[m].toLowerCase().charCodeAt(0);
      if(c < keyCode){
        i = m;
      }else{
        j = m;
      }
    }
    c1 = this.pinyins[i].toLowerCase().charCodeAt(0);
    c2 = this.pinyins[j].toLowerCase().charCodeAt(0);
    if(c1 != keyCode && c2 != keyCode) return -1;
    if(c1 == keyCode) return i;
    if(c2 == keyCode) return j;
  },
  
  onKeyUp: function(e){
    var code = e.keyCode;
    var now = new Date().getTime();
    if(this.lastPressedAt == null || (now - this.lastPressedAt) < 1000){
      this.lastPressedAt = now;
      this.keyPressed += String.fromCharCode(e.keyCode);
    }else{
      this.lastPressedAt = now;
      this.keyPressed = String.fromCharCode(e.keyCode);
    }
    var len = this.keyPressed.length;
    var startPos = this.mappings.get(this.keyPressed.charCodeAt(0));
    if(startPos == null) return;
    for(var i = startPos;i < this.pinyins.length; i++){
      if(this.pinyins[i].substr(0, len) == this.keyPressed.toLowerCase()){ // start with this.keyPressed?
        if($(this.gameSelectorID).selectedIndex != i){
          $(this.gameSelectorID).value = $(this.gameSelectorID).options[i].value;
          this.currentGameID = $(this.gameSelectorID).value;
          setTimeout(this.fireGameChangeEvent.bind(this), 500);
        }
        return;
      }
    }
  },

  fireGameChangeEvent: function(){
    if(this.currentGameID == null) return;
    $(this.gameSelectorID).simulate('change'); // be sure to include event.simulate.js first
    this.currentGameID = null;
  }

});

Iyxzone.Game.Autocompleter = Class.create(Autocompleter.Base, {

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

    this.options.parameters += '&tag[name]=' + this.element.value;

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



Object.extend(Iyxzone.Game.Suggestor, {

  tagNames: new Array(),

  tagList: null,

  prepare: function(){
    // set text box list
    this.tagList = new TextBoxList($('game_tags'), {
      onBoxDispose: this.removeTag.bind(this),
      holderClassName: 'friend-select-list s_clear',
      bitClassName: ''
    }); 

    // set custom auto complete
    new Iyxzone.Game.Autocompleter(this.tagList.getMainInput(), $('game_tag_list'), '/auto_complete_for_game_tags', {
      method: 'get',
      emptyText: '没有匹配的关键字...',
      afterUpdateElement: this.afterSelectTag.bind(this),
      onInputFocus: this.showTips.bind(this),
      comp: this.tagList.holder
    });
    
  },

  showTips: function(){
    $('game_tag_list').innerHTML = '输入游戏特点, 拼音或者汉字';
    $('game_tag_list').setStyle({
      position: 'absolute',
      left: this.tagList.holder.positionedOffset().left + 'px',
      top: (this.tagList.holder.positionedOffset().top + this.tagList.holder.getHeight()) + 'px',
      width: (this.tagList.holder.getWidth() - 10) + 'px',
      maxHeight: '200px',
      overflow: 'auto',
      padding: '5px',
      background: 'white',
      border: '1px solid #E7F0E0'
    });
    $('game_tag_list').show();
  },

  afterSelectTag: function(input, selectedLI){
    var text = selectedLI.childElements()[0].innerHTML;
    this.addTag(text);
    input.clear();
  },

  hasTag: function(tagName){
    for(var i=0;i<this.tagNames.length;i++){
      if(tagName == this.tagNames[i])
        return true;
    }
    return false;
  },

  addTag: function(tagName){
    if(this.hasTag(tagName)){
      tip('你已经选择了该标签');
      return;
    }
    this.tagList.add(tagName, tagName);
    this.tagNames.push(tagName);
  },

  removeTag: function(box, input){
    var tagNames = Iyxzone.Game.Suggestor.tagNames;
    var text = input.value;
    for(var i=0;i< tagNames.length;i++){
      if(text == tagNames[i])
        tagNames.splice(i,1);
    }
  },

  suggest: function(button){
    if(this.tagNames.length == 0){
      notice('请您点击游戏相关类型，以便我们向您推荐');
    }else{
      var newGame = $('new_game');
      new Ajax.Request('/game_suggestions/game_tags', {
        method: 'get',
        parameters: {selected_tags: this.tagNames.join(','), new_game: newGame.checked},
        onLoading: function(){
          Iyxzone.disableButton(button, '等待...');
        },
        onComplete: function(){
          Iyxzone.enableButton(button, '推荐');
        },
        onSuccess: function(transport){
          $('game_suggestion_area').innerHTML = transport.responseText;
        }.bind(this)
      });
    }
  },

  toggleAdvancedOptions: function(){
    if($('advanced_options').visible()){
      Effect.BlindUp($('advanced_options'));
    }else{
      Effect.BlindDown($('advanced_options'));
    }
  }

}); 

Object.extend(Iyxzone.Game.Feeder, {

  idx: 0,

  moreFeeds: function(gameID){
    $('more_feed').innerHTML = '<img src="/images/loading.gif" />';

    new Ajax.Request('/games/' + gameID + '/more_feeds?idx=' + this.idx, {
      method: 'get',
      onSuccess: function(transport){
        this.idx++;
      }.bind(this)
    });
  }

});
