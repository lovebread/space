Iyxzone.Profile = {
  version: '1.0',
  author: ['高侠鸿'],
  Editor: {},
  Feeder: {}
};

Object.extend(Iyxzone.Profile.Editor, {

  loading: function(div, title){
    div.innerHTML = '<div class="edit-toggle space edit"><h3 class="s_clear"><strong class="left">' + title + '</strong><a href="#" class="right">取消</a></h3><div class="formcontent con con2"><img src="/images/loading.gif"/></div></div>';
  },

  showError: function(div, content){
    var span = new Element('span', {class: 'icon-warn'});
    $(div).update(content);
    Element.insert($(div), {top: span});
  },

  clearError: function(div){
    $(div).innerHTML = '';
  },

  regionSelector: null,

  setRegionSelector: function(regionID, cityID, districtID){
    this.regionSelector = new Iyxzone.ChineseRegion.Selector(regionID, cityID, districtID);
  },

  basicInfoHTML: null,

  editBasicInfoHTML: null,

  isEditingBasicInfo: false,

  editBasicInfo: function(profileID){
    if(this.isEditingBasicInfo)
      return;
    else
      this.isEditingBasicInfo = true;

    var frame = $('basic_info_frame');
    this.basicInfoHTML = frame.innerHTML;
    if(this.editBasicInfoHTML){
      frame.innerHTML = this.editBasicInfoHTML;
      this.regionSelector.setEvents();
    }else{
      new Ajax.Updater('basic_info_frame', '/profiles/' + profileID + '/edit?type=1', {
        method: 'get',
        evalScripts: true,
        onLoading: function(){
          this.loading(frame, '基本信息');
        }.bind(this),
        onSuccess: function(transport){
          this.editBasicInfoHTML = transport.responseText;
        }.bind(this)
      });
    }
  },

  cancelEditBasicInfo: function(){
    $('basic_info_frame').innerHTML = this.basicInfoHTML;
    this.isEditingBasicInfo = false;
  },

  isLoginValid: function(){
    var login = $('profile_login');
  
    this.clearError('login_error');

    if(login.value == ''){
      this.showError('login_error', '昵称不能为空');
      return false;
    }

    if(login.value.length < 6){
      this.showError('login_error', '昵称至少要4个字符');
      return false;
    }
    if(login.value.length > 16){
      this.showError('login_error', '昵称最多16个字符');
      return false;
    }

    first = login.value[0];
    if((first >= 'a' && first <= 'z') || (first >= 'A' && first <= 'Z')){
      if(!login.value.match(/[A-Za-z0-9\_]+/)){
        this.showError('login_error', '昵称只允许字母和数字');
        return false;
      }
    }else{
      this.showError('login_error', '昵称必须以字母开头');
      return false;
    }

    return true;
  },

  validateBasicInfo: function(){
    return this.isLoginValid();
  },

  updateBasicInfo: function(profileID, button, event){
    Event.stop(event);
    if(this.validateBasicInfo()){
      new Ajax.Request('/profiles/' + profileID + '?type=1', {
        method: 'put',
        parameters: $('basic_info_form').serialize(),
        onLoading: function(){
          Iyxzone.disableButton(button, '等待...');
        },
        onComplete: function(){
          Iyxzone.enableButton(button, '保存');
        },
        onSuccess: function(transport){
          $('basic_info_frame').innerHTML = transport.responseText;
          this.isEditingBasicInfo = false;
          this.editBasicInfoHTML = null;
          this.regionSelector = null;
        }.bind(this)
      });
    }
  },

  contactInfoHTML: null,

  editContactInfoHTML: null,

  isEditingContactInfo: false,

  editContactInfo: function(profileID){
    if(this.isEditingContactInfo)
      return;
    else
      this.isEditingContactInfo = true;

    var frame = $('contact_info_frame');
    this.contactInfoHTML = frame.innerHTML;
    if(this.editContactInfoHTML){
      frame.innerHTML = this.editContactInfoHTML;
      facebox.watchClickEvents();
    }else{
      new Ajax.Updater('contact_info_frame', '/profiles/' + profileID + '/edit?type=2', {
        method: 'get',
        onLoading: function(){
          this.loading(frame, '联系信息');
        }.bind(this),
        onSuccess: function(transport){
          this.editContactInfoHTML = transport.responseText;
          facebox.watchClickEvents();
        }.bind(this)
      });
    }
  },

  cancelEditContactInfo: function(){
    $('contact_info_frame').innerHTML = this.contactInfoHTML;
    this.isEditingContactInfo = false;
  },

  isQQValid: function(){
    var qq = $('profile_qq').value;

    this.clearError('qq_error');

    if(qq != ''){
      if(qq.match(/\d+/)){
        if(qq.length < 4 || qq.length > 15){
          this.showError('qq_error', 'qq号码长度不对');
          return false;
        }
      }else{
        this.showError('qq_error', 'qq号码只能由数字组成');
        return false;
      }
    }

    return true;
  },
 
  isPhoneValid: function(){
    var phone = $('profile_phone').value;

    this.clearError('phone_error');

    if(phone != ''){
      if(phone.match(/\d+/)){
        if(phone.length < 8 || phone.length > 15){
          this.showError('phone_error', '联系电话长度不对');
          return false;
        }
      }else{
        this.showError('phone_error', '联系电话只能由数字组成');
        return false;
      }
    }

    return true;
  },

  isUrlValid: function(){
    var url = $('profile_website').value;

    this.clearError('url_error');

    if(url != ''){
      if(!url.match(/^((https?:\/\/)?)(([a-zA-Z0-9_-])+(\.)?)*(:\d+)?(\/((\.)?(\?)?=?&?[a-zA-Z0-9_-](\?)?)*)*$/)){
        this.showError('url_error', '非法的url地址');
        return false;
      }
    }

    return true;
  },
 
  validateContactInfo: function(){
    var v1 = this.isQQValid();
    var v2 = this.isPhoneValid();
    var v3 = this.isUrlValid();
    return v1 && v2 && v3;
  },

  updateContactInfo: function(profileID, button, event){
    Event.stop(event);
    if(this.validateContactInfo()){
      new Ajax.Request('/profiles/' + profileID + '?type=2', {
        method: 'put',
        parameters: $('contact_info_form').serialize(),
        onLoading: function(){
          Iyxzone.disableButton(button, '等待...');
        }.bind(this),
        onComplete: function(){
          Iyxzone.enableButton(button, '保存');
        }.bind(this),
        onSuccess: function(transport){
          this.editContactInfoHTML = null;
          $('contact_info_frame').innerHTML = transport.responseText;
          this.isEditingContactInfo = false;
        }.bind(this)
      });
    }
  },

  charactersHTML: null,

  editCharactersHTML: null,

  charactersCount: 0,

  isEditingCharacters: false,

  gameSelectors: new Hash(),

  newGameSelectors: new Hash(),

  delCharacterIDs: new Array(),

  addGameSelector: function(pinyins, characterID, newCharacter, gameDetails){
    if(newCharacter){
      prefix = 'new';
    }else{
      prefix = 'existing';
    }

    var selectPrefix = 'profile_' + prefix + '_characters_' + characterID + '_';

    var selector = new Iyxzone.Game.PinyinSelector(
      pinyins,
      selectPrefix + 'game_id',
      selectPrefix + 'area_id',
      selectPrefix + 'server_id',
      selectPrefix + 'race_id',
      selectPrefix + 'profession_id',
      gameDetails,
      {}
    );
   
    if(newCharacter){
      this.newGameSelectors.set(prefix + '_' + characterID, selector);
    }else{
      this.gameSelectors.set(prefix + "_" + characterID, selector);
    }
  },

  editCharacters: function(profileID){
    if(this.isEditingCharacters)
      return
    else
      this.isEditingCharacters = true;

    var frame = $('character_frame');
    this.charactersHTML = frame.innerHTML;
    if(this.editCharactersHTML){
      frame.innerHTML = this.editCharactersHTML;
      this.gameSelectors.values().each(function(selector){
        selector.setEvents();
      });
    }else{
      new Ajax.Updater('character_frame', '/profiles/' + profileID + '/edit?type=3', {
        method: 'get',
        evalScripts: true,
        onLoading: function(){
          this.loading(frame, '游戏角色信息');
        }.bind(this),
        onSuccess: function(transport){
          this.editCharactersHTML = transport.responseText;
        }.bind(this)
      });
    }
  },

  cancelEditCharacters: function(){
    $('character_frame').innerHTML = this.charactersHTML;
    this.isEditingCharacters = false;
    this.delCharacterIDs = new Array();
  },

  newCharacter: function(){
    new Ajax.Updater('user_characters', '/characters/new?id=' + this.charactersCount, {
      method: 'get',
      insertion: 'bottom',
      evalScripts: true,
      onLoading: function(){
        $('new_character_loading').innerHTML = '<img src="images/loading.gif" />';
      }, 
      onSuccess: function(){
        $('new_character_loading').innerHTML = '';
        this.charactersCount++;
      }.bind(this)
    });
  },

  isCharacterNameValid: function(characterID, newCharacter){
    if(newCharacter)
      prefix = 'new';
    else
      prefix = 'existing';

    var name = $('profile_' + prefix + '_characters_' + characterID + '_name').value;
    var div = prefix + '_character_' + characterID + '_name_error';
    
    this.clearError(div);

    if(name.length == ''){
      this.showError(div, '游戏角色的名称不能为空');
      return false;
    }

    return true
  },

  isCharacterLevelValid: function(characterID, newCharacter){
    if(newCharacter)
      prefix = 'new';
    else
      prefix = 'existing';
    
    var level = $('profile_' + prefix + '_characters_' + characterID + '_level').value;
    var div = prefix + '_character_' + characterID + '_level_error';
    
    this.clearError(div);

    if(level == ''){
      this.showError(div, '等级不能为空');
      return false;
    }

    if(!parseInt(level)){
      this.showError(div, '等级必须是数字');
      return false;
    }

    return true;
  },

  isGameValid: function(characterID, newCharacter){
    var valid = true;

    if(newCharacter)
      prefix = 'new';
    else
      prefix = 'existing';
   
    var gameID = $('profile_' + prefix + '_characters_' + characterID + '_game_id').value;
    var gameDiv = prefix + '_character_' + characterID + '_game_id_error';
    var areaID = $('profile_' + prefix + '_characters_' + characterID + '_area_id').value;
    var areaDiv = prefix + '_character_' + characterID + '_area_id_error';
    var serverID = $('profile_' + prefix + '_characters_' + characterID + '_server_id').value;
    var serverDiv = prefix + '_character_' + characterID + '_server_id_error';
    var raceID = $('profile_' + prefix + '_characters_' + characterID + '_race_id').value;
    var raceDiv = prefix + '_character_' + characterID + '_race_id_error';
    var professionID = $('profile_' + prefix + '_characters_' + characterID + '_profession_id').value;
    var professionDiv = prefix + '_character_' + characterID + '_profession_id_error';
    var game = null;
    if(newCharacter)
      game = this.newGameSelectors.get(prefix + '_' + characterID).getDetails();
    else
      game = this.gameSelectors.get(prefix + '_' + characterID).getDetails();
    this.clearError(gameDiv);
    this.clearError(areaDiv);
    this.clearError(serverDiv);
    this.clearError(raceDiv);
    this.clearError(professionDiv);

    if(gameID == ''){
      this.showError(gameDiv, "请选择游戏");
      valid = false;
    }

    if(game && !game.no_areas && areaID == ''){
      this.showError(areaDiv, "请选择服务区");
      valid = false;
    }

    if(game && !game.no_servers && serverID == ''){
      this.showError(serverDiv, "请选择服务器");
      valid = false;
    }

    if(game && !game.no_races && raceID == ''){
      this.showError(raceDiv, "请选择种族");
      valid = false;
    }

    if(game && !game.no_professions && professionID == ''){
      this.showError(professionDiv, "请选择职业");
      valid = false;
    }

    return valid; 
  },
 
  validateCharactersInfo: function(){
    var valid = true;
    var inputs = $('characters_form').getInputs();
    var characterIDs = new Array();

    this.gameSelectors.keys().each(function(key){
      var id = parseInt(key.match(/\d+/)[0]);
      if(!this.delCharacterIDs.include(id))
        characterIDs.push(key);
    }.bind(this));

    this.newGameSelectors.keys().each(function(key){
      characterIDs.push(key);
    }.bind(this));

    characterIDs.each(function(key){
      var id = key.match(/\d+/)[0];
      var newCharacter = null;
      if(key.match(/new/))
        newCharacter = true;
      else
        newCharacter = false;
      valid &= this.isCharacterNameValid(id, newCharacter);
      valid &= this.isCharacterLevelValid(id, newCharacter);
      valid &= this.isGameValid(id, newCharacter);
    }.bind(this));

    return valid;
  },

  updateCharacters: function(profileID, token, button, event){
    Event.stop(event);
    if(this.validateCharactersInfo()){
      // construct del character ids
      var delCharacterParams = '';
      for(var i = 0; i < this.delCharacterIDs.length; i++){
        delCharacterParams += "profile[del_characters][]=" + this.delCharacterIDs[i] + "&";
      }

      new Ajax.Request('/profiles/' + profileID + '?type=3', {
        method: 'put',
        parameters: delCharacterParams + $('characters_form').serialize(),
        onSuccess: function(transport){
          $('character_frame').innerHTML = transport.responseText;
          this.editCharactersHTML = null;
          this.gameSelectors = new Hash();
          this.newGameSelectors = new Hash();
          this.delCharacterIDs = new Array();
          this.isEditingCharacters = false;
        }.bind(this)
      }); 
    }
  },

  removeCharacter: function(characterID, newCharacter, link){
    if(newCharacter)
      prefix = 'new';
    else
      prefix = 'existing';

    if(newCharacter){
      this.newGameSelectors.unset(prefix + '_character_' + characterID);
    }else{
      this.delCharacterIDs.push(characterID); 
    }

    $(prefix + '_character_' + characterID).remove();
  },

  edit: function(profileID){
    this.editBasicInfo(profileID);
    this.editContactInfo(profileID);
    this.editCharacters(profileID);    
  },

});

Object.extend(Iyxzone.Profile.Feeder, {
  
  idx: 0,

  moreFeeds: function(profileID){
    // loading
    $('more_feed').innerHTML = '<img src="/images/loading.gif" />';

    new Ajax.Request('/profiles/' + profileID + '/more_feeds?idx=' + this.idx, {
      method: 'get',
      onSuccess: function(transport){
        this.idx++;
      }.bind(this)
    });  
  }

});
