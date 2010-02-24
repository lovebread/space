Iyxzone.Register = {
  version: '1.0',
  author: ['高侠鸿'],
};

Object.extend(Iyxzone.Register, {

  gameSelector: null,

  load: function(div){
    $(div).innerHTML = '<img src="/images/loading.gif" />';
  },

  error: function(div, content){
    var span = new Element('span', {class: 'icon-warn'});
    $(div).className = 'red';
    $(div).update(content);
    Element.insert($(div), {top: span}); 
  },

  clearError: function(div){
    $(div).innerHTML = '';
  },

  pass: function(div){
    $(div).innerHTML = '';
    $(div).className = 'fldstatus';
  },

  tip: function(div, content){
    $(div).className = '';
    $(div).update(content);
  },

  showLoginRequirement: function(){
    this.tip('login_info', '只能由数字，字母组成，大小4-16字符');
  },

  validateLogin: function(){
    var login = $('user_login').value;

    if(login == ''){
      this.error('login_info', '不能为空');
      return false;
    }

    if(login.length < 4){
      this.error('login_info', '至少要4个字符');
      return false;
    }
    if(login.length > 16){
      this.error('login_info', '最多16个字符');
      return false;
    }

    first = login[0];
    if((first >= 'a' && first <= 'z') || (first >= 'A' && first <= 'Z')){
      if(login.match(/[A-Za-z0-9\_]+/)){
        this.pass('login_info');
        return true;
      }else{
        this.error('login_info', '只允许字母和数字');
        return false;
      }
    }else{
      this.error('login_info', '必须以字母开头');
      return false;
    }
  },

  showEmailRequirement: function(){
    this.tip('email_info', '输入合法的邮件地址');
  },

  validateEmail: function(){
    var email = $('user_email').value;

    if(email == ''){
      this.error('email_info', '邮件不能为空');
      return false;
    }

    if(email.match(/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/)){
      this.load('email_info');

      new Ajax.Request('/register/validates_email_uniqueness?email='+encodeURIComponent(email), {
        method: 'get',
        onSuccess: function(transport){
          if(transport.responseText == 'yes'){
            this.pass('email_info');
          }else{
            this.error('email_info', '该邮箱已被注册');
          }
        }.bind(this)
      });

      return true;
    }else{
      this.error('email_info', '非法的邮件格式');
      return false;
    }
  },

  showPasswordRequirement: function(){
    this.tip('password_info', '密码6－20个字符');
  },

  validatePassword: function(){
    var password = $('user_password').value;
    var strongReg = new RegExp("^(?=.{8,})(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*\\W).*$", "g");
    var mediumReg = new RegExp("^(?=.{7,})(((?=.*[A-Z])(?=.*[a-z]))|((?=.*[A-Z])(?=.*[0-9]))|((?=.*[a-z])(?=.*[0-9]))).*$", "g");

    // check length
    if(password == ''){
      this.error('password_info', '密码不能为空');
      return false;
    }
    if(password.length < 6){
      this.error('password_info', '至少6个字符');
      return false;
    }
    if(password.length > 20){
      this.error('password_info', '最多20个字符');
      return false;
    }

    // check strength
    if(password.match(strongReg)){
      this.tip('password_info', '密码强度: 强');
      return true;
    }else if(password.match(mediumReg)){
      this.tip('password_info', '密码强度: 中');
      return true;
    }else{
      this.tip('password_info', '密码强度: 弱');
      return true;
    }
  },

  showPasswordConfirmRequirement: function(){
    this.tip('password_confirmation_info', '确认你的密码');
  },

  validatePasswordConfirmation: function(){
    var password = $('user_password').value;
    var passwordConfirmation = $('user_password_confirmation').value;

    if(password == ''){
      this.error('password_info', '密码不能为空');
      return false;
    }

    if(password == passwordConfirmation){
      this.pass('password_confirmation_info');
      return true;
    }else{
      this.error('password_confirmation_info', '两次密码不一致');
      return false;
    }
  },

  gameSelectors: new Hash(), // characterID => gameSelector

  charactersCount: 1,

  addGameSelector: function(pinyins, id, details){
    var prefix = 'profile_new_characters_' + id + '_';

    var selector = new Iyxzone.Game.PinyinSelector(
      pinyins,
      prefix + 'game_id',
      prefix + 'area_id',
      prefix + 'server_id',
      prefix + 'race_id',
      prefix + 'profession_id',
      details,
      {}
    );

    this.gameSelectors.set(id, selector);
  },

  isCharacterNameValid: function(id){
    var name = $('profile_new_characters_' + id + '_name').value;
    var div = 'character_' + id + '_name_error';

    this.clearError(div);

    if(name.length == ''){
      this.error(div, '游戏角色的名称不能为空');
      return false;
    }

    return true
  },

  isCharacterLevelValid: function(id){
    var level = $('profile_new_characters_' + id + '_level').value;
    var div = 'character_' + id + '_level_error';

    this.clearError(div);

    if(level == ''){
      this.error(div, '等级不能为空');
      return false;
    }

    if(!parseInt(level)){
      this.error(div, '等级不合法');
      return false;
    }

    return true;
  },

  isGameValid: function(id){
    var valid = true;
    var gameID = $('profile_new_characters_' + id + '_game_id').value;
    var gameDiv = 'character_' + id + '_game_id_error';
    var areaID = $('profile_new_characters_' + id + '_area_id').value;
    var areaDiv = 'character_' + id + '_area_id_error';
    var serverID = $('profile_new_characters_' + id + '_server_id').value;
    var serverDiv = 'character_' + id + '_server_id_error';
    var raceID = $('profile_new_characters_' + id + '_race_id').value;
    var raceDiv = 'character_' + id + '_race_id_error';
    var professionID = $('profile_new_characters_' + id + '_profession_id').value;
    var professionDiv = 'character_' + id + '_profession_id_error';
    var game = this.gameSelectors.get(id).getDetails();
    this.clearError(gameDiv);
    this.clearError(areaDiv);
    this.clearError(serverDiv);
    this.clearError(raceDiv);
    this.clearError(professionDiv);

    if(gameID == ''){
      this.error(gameDiv, "请选择游戏");
      valid = false;
    }

    if(game && !game.no_areas && areaID == ''){
      this.error(areaDiv, "请选择服务区");
      valid = false;
    }

    if(game && !game.no_servers && serverID == ''){
      this.error(serverDiv, "请选择服务器");
      valid = false;
    }

    if(game && !game.no_races && raceID == ''){
      this.error(raceDiv, "请选择种族");
      valid = false;
    }

    if(game && !game.no_professions && professionID == ''){
      this.error(professionDiv, "请选择职业");
      valid = false;
    }

    return valid;
  },

  validateCharacters: function(){
    var valid = true;

    this.gameSelectors.keys().each(function(id){
      valid &= this.isCharacterNameValid(id);
      valid &= this.isCharacterLevelValid(id);
      valid &= this.isGameValid(id);
    }.bind(this));

    return valid;
  },

  newCharacter: function(event){
    Event.stop(event);
    new Ajax.Updater('characters', '/register/new_character?id=' + this.charactersCount, {
      method: 'get',
      insertion: 'bottom',
      evalScripts: true,
      onSuccess: function(){
      }.bind(this)
    });
    this.charactersCount++;
  },

  removeCharacter: function(id){
    this.gameSelectors.unset(id);
    $('character_' + id).remove();
  },

  submit: function(event){
    Event.stop(event);

    var valid = true;
    valid &= this.validateCharacters();
    valid &= this.validateLogin();
    valid &= this.validateEmail();
    valid &= this.validatePassword();
    valid &= this.validatePasswordConfirmation();
    
    if(!valid)
      return;

    if(!$('agree_contact').checked){
      tip("请查看协议");
      return;
    }

    if(this.gameSelectors.keys().count == 0){
      tip("至少要有1个游戏角色");
      return;
    }

    new Ajax.Request('/users/', {
      method: 'post',
      parameters: $('register_form').serialize()
    }); 
  },

});
