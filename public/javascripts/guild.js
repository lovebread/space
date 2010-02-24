Iyxzone.Guild = {
  version: '1.0',
  author: ['高侠鸿'],
  Builder: {},
  Feeder: {},
  Editor: {}
};

Object.extend(Iyxzone.Guild.Builder, {

  validate: function(){
    if($('guild_name').value == ''){
      error('名字不能为空');
      return false;
    }
    if($('guild_game_id') && $('guild_game_id').value == ''){
      error('游戏类别不能为空');
      return false;
    }
    if($('guild_name').value.length >= 100){
      error('名字最长100个字符');
      return false;
    }
    if($('guild_description').value.length >= 1000){
      error('描述最多1000个字符');
      return false;
    }
    return true;
  },

  save: function(event){
    Event.stop(event);
    if(this.validate()){
      var form = $('guild_form');
      form.action = '/guilds';
      form.method = 'post';
      form.submit();
    }
  }

});

Object.extend(Iyxzone.Guild.Feeder, {
  
  idx: 0,

  moreFeeds: function(guildID){
    // show loading page
    $('more_feed').innerHTML = '<img src="/images/loading.gif" />';

    // send ajax request
    new Ajax.Request('/guilds/' + guildID + '/more_feeds?idx=' + this.idx, {
      method: 'get',
      onSuccess: function(){
        this.idx++;
      }
    });
  }

});

Object.extend(Iyxzone.Guild.Editor, {

  showError: function(div, content){
    var span = new Element('span', {class: 'icon-warn'});
    $(div).update(content);
    Element.insert($(div), {top: span});
  },

  clearError: function(div){
    $(div).innerHTML = '';
  },

  loading: function(div, title){
    $(div).innerHTML = "<div class='edit-toggle space edit'><h3 class='s_clear'><strong class='left'>" + title + "</strong><a class='right' href='#'>取消</a></h3><div class='formcontent con con2'><img src='/images/loading.gif'/></div></div>";
  },

  attendanceRulesHTML: null,

  editAttendanceRulesHTML: null,

  editAttendanceRules: function(guildID){
    this.attendanceRulesHTML = $('attendance_rule_frame').innerHTML;
    if(this.editAttendanceRulesHTML){
      $('attendance_rule_frame').innerHTML = this.editAttendanceRulesHTML;
    }else{
      new Ajax.Request('/guilds/' + guildID + '/rules?type=0', {
        method: 'get',
        onLoading: function(){
          this.loading('attendance_rule_frame', '出勤规则');
        }.bind(this),
        onSuccess: function(transport){
          this.editAttendanceRulesHTML = transport.responseText;
          $('attendance_rule_frame').innerHTML = transport.responseText;
        }.bind(this)
      });
    }
  },

  isPresenceOutcomeValid: function(){
    var div = 'presence_rule_error';
    var outcome = $('presence_outcome').value;  

    this.clearError(div);

    if(outcome == ''){
      this.showError(div, "不能为空");
      return false;
    }else{
      outcome = parseInt(outcome);
      if(!outcome){
        this.showError(div, "必须是个整数");
        return false;
      }else if(outcome < 0){
        this.showError(div, "必须是正整数");
        return false;
      }
    }

    return true
  },

  isAbsenceOutcomeValid: function(){
    var div = 'absence_rule_error'; 
    var outcome = $('absence_outcome').value; 
    
    this.clearError(div);

    if(outcome == ''){
      this.showError(div, "不能为空");
      return false;
    }else{
      outcome = parseInt(outcome);
      if(!outcome){
        this.showError(div, "必须是个整数");
        return false;
      }else if(outcome > 0){
        this.showError(div, "必须是负数");
        return false;
      }
    }
  
    return true
  },

  validateAttendanceRules: function(){
    var v1 = this.isPresenceOutcomeValid();
    var v2 = this.isAbsenceOutcomeValid();
    return v1 && v2;
  },

  updateAttendanceRules: function(guildID, event){
    Event.stop(event);
    if(this.validateAttendanceRules()){
      new Ajax.Request('/guilds/' + guildID + '/rules/create_or_update?type=0', {
        method: 'post',
        parameters: $('attendance_rules_form').serialize(),
        onSuccess: function(transport){
          $('attendance_rule_frame').innerHTML = transport.responseText;
          this.editAttendanceRulesHTML = null;
        }.bind(this)
      });
    }
  },

  cancelEditAttendanceRules: function(guildID){
    $('attendance_rule_frame').innerHTML = this.attendanceRulesHTML;
  },
  
  basicRulesHTML: null,

  editBasicRulesHTML: null,
 
  basicRulesCount: 0,

  delRuleIDs: new Array(),

  editBasicRules: function(guildID){
    this.basicRulesHTML = $('basic_rule_frame').innerHTML;
    if(this.editBasicRulesHTML){
      $('basic_rule_frame').innerHTML = this.editBasicRulesHTML;
    }else{
      new Ajax.Updater('basic_rule_frame', '/guilds/' + guildID + '/rules?type=1', {
        method: 'get',
        evalScripts: true,
        onLoading: function(){
          this.loading('basic_rule_frame', '其他规则');
        }.bind(this),
        onSuccess: function(transport){
          this.editBasicRulesHTML = transport.responseText;
        }.bind(this)
      });
    }
  },

  newBasicRule: function(guildID, button){
    new Ajax.Updater('basic_rules', '/guilds/' + guildID + '/rules/new?id=' + this.basicRulesCount, {
      method: 'get',
      insertion: 'bottom',
      evalScripts: true,
      onSuccess: function(transport){
      }.bind(this)
    });
    this.basicRulesCount++;
  },

  isRuleReasonValid: function(ruleID, newRule){
    if(newRule)
      prefix = 'new';
    else
      prefix = 'existing';

    var div = prefix + '_rule_' + ruleID + '_reason_error';
    var reason = $('guild_' + prefix + '_rules_' + ruleID + '_reason').value;

    this.clearError(div);

    if(reason == ''){
      this.showError(div, '原因不能为空');
      return false;
    }
    
    return true;
  },

  isRuleOutcomeValid: function(ruleID, newRule){
    if(newRule)
      prefix = 'new';
    else
      prefix = 'existing';

    var div = prefix + '_rule_' + ruleID + '_outcome_error';
    var outcome = $('guild_' + prefix + '_rules_' + ruleID + '_outcome').value;

    this.clearError(div);

    if(outcome == ''){
      this.showError(div, '结果不能为空');
      return false;
    }else if(!parseInt(outcome)){
      this.showError(div, '结果必须是整数');
      return false;
    }

    return true;
  },

  validateBasicRules: function(){
    var valid = true;

    var inputs = $('basic_rules_form').getInputs();

    inputs.each(function(input){
      if(input.type != 'text')
        return;
      var inputID = input.id;
      var newRule = null;
      if(inputID.match(/new/))
        newRule = true;
      else
        newRule = false;
      var id = inputID.match(/\d+/)[0];
      if(inputID.match(/reason/)){
        valid &= this.isRuleReasonValid(id, newRule);
      }else if(inputID.match(/outcome/)){
        valid &= this.isRuleOutcomeValid(id, newRule);
      }
    }.bind(this));
    
    return valid;
  },

  updateBasicRules: function(guildID, event){
    Event.stop(event);
    if(this.validateBasicRules()){
      var delParams = '';
      for(var i=0;i < this.delRuleIDs.length;i++){
        delParams += "guild[del_rules][]=" + this.delRuleIDs[i] + "&";
      }

      new Ajax.Request('/guilds/' + guildID + '/rules/create_or_update?type=1', {
        method: 'post',
        parameters: delParams + $('basic_rules_form').serialize(),
        onSuccess: function(transport){
          $('basic_rule_frame').innerHTML = transport.responseText;
          this.editBasicRulesHTML = null;
          this.delRuleIDs = new Array();
          this.basicRules = new Hash();
        }.bind(this)
      });
    }
  },

  cancelEditBasicRules: function(guildID){
    $('basic_rule_frame').innerHTML = this.basicRulesHTML;
    this.delRuleIDs = new Array();
  },

  removeBasicRule: function(ruleID, newRule, div){
    if(newRule)
      prefix = 'new';
    else
      prefix = 'existing';

    if(!newRule)
      this.delRuleIDs.push(ruleID);
    
    $(prefix + '_rule_' + ruleID).remove();
  },

  bossesHTML: null,

  editBossesHTML: null,

  bossesCount: 0,

  delBossIDs: new Array(),

  editBosses: function(guildID){
    this.bossesHTML = $('boss_frame').innerHTML;
    this.loading('boss_frame', 'BOSS');

    if(this.editBossesHTML){
      $('boss_frame').innerHTML = this.editBossesHTML;
    }else{
      new Ajax.Updater('boss_frame', '/guilds/' + guildID + '/bosses', {
        method: 'get',
        evalScripts: true,
        onSuccess: function(transport){
          this.editBossesHTML = transport.responseText;
        }.bind(this)
      });
    }
  },

  newBoss: function(guildID){
    new Ajax.Updater('guild_bosses', '/guilds/' + guildID + '/bosses/new?id=' + this.bossesCount, {
      method: 'get',
      evalScripts: true,
      insertion: 'bottom',
      onSuccess: function(transport){
      }.bind(this)
    });
    this.bossesCount++;
  },

  isBossNameValid: function(bossID, newBoss){
    if(newBoss)
      prefix = 'new';
    else
      prefix = 'existing';

    var div = prefix + '_boss_' + bossID + '_name_error';
    var name = $('guild_' + prefix + '_bosses_' + bossID + '_name').value;

    this.clearError(div);

    if(name == ''){
      this.showError(div, '名字不能为空');
      return false;
    }

    return true;
  },

  isBossRewardValid: function(bossID, newBoss){
    if(newBoss)
      prefix = 'new';
    else
      prefix = 'existing';

    var div = prefix + '_boss_' + bossID + '_reward_error';
    var reward = $('guild_' + prefix + '_bosses_' + bossID + '_reward').value;

    this.clearError(div);

    if(reward == ''){
      this.showError(div, '奖励不能为空');
      return false;
    }else{
      reward = parseInt(reward);
      if(!reward){
        this.showError(div, '奖励不合法');
        return false;
      }else if(reward <= 0){
        this.showError(div, '奖励必须是正数');
        return false;
      }
    }

    return true;
  },

  validateBosses: function(){
    var valid = true;
    var inputs = $('bosses_form').getInputs();

    inputs.each(function(input){
      if(input.type != 'text')
        return;
      var inputID = input.id;
      var newBoss = null;
      if(inputID.match(/new/))
        newBoss = true;
      else
        newBoss = false;
      var id = inputID.match(/\d+/)[0];
      if(inputID.match(/name/))
        valid &= this.isBossNameValid(id, newBoss);
      else
        valid &= this.isBossRewardValid(id, newBoss);
    }.bind(this));

    return valid; 
  },
  
  updateBosses: function(guildID, event){
    Event.stop(event);
    if(this.validateBosses()){
      var delParams = '';
      for(var i=0; i < this.delBossIDs.length; i++){
        delParams += "guild[del_bosses][]=" + this.delBossIDs[i] + "&";
      }
      new Ajax.Updater('boss_frame', '/guilds/' + guildID + '/bosses/create_or_update', {
        method: 'post',
        parameters: delParams + $('bosses_form').serialize(),
        onSuccess: function(transport){
          this.editBossesHTML = null;
          this.delBossIDs = new Array();
        }.bind(this)
      });
    }
  },

  cancelEditBosses: function(guildID){
    $('boss_frame').innerHTML = this.bossesHTML;
    this.delBossIDs = new Array();
  },

  removeBoss: function(bossID, newBoss){
    if(newBoss)
      prefix = 'new';
    else
      prefix = 'existing';

    if(!newBoss)
      this.delBossIDs.push(bossID);
  
    $(prefix + '_boss_' + bossID).remove();
  },

  gearsHTML: null,

  editGearsHTML: null,

  gearsCount: 0,

  delGearIDs: new Array(),

  editGears: function(guildID){
    this.gearsHTML = $('gear_frame').innerHTML;
    if(this.editGearsHTML){
      $('gear_frame').innerHTML = this.editGearsHTML;
    }else{
      new Ajax.Updater('gear_frame', '/guilds/' + guildID + '/gears', {
        method: 'get',
        evalScripts: true,
        onLoading: function(){
          this.loading('gear_frame', '装备');
        }.bind(this),
        onSuccess: function(transport){
          this.editGearsHTML = transport.responseText;
        }.bind(this)
      });
    }
  },

  newGear: function(guildID){
    new Ajax.Updater('guild_gears', '/guilds/' + guildID + '/gears/new?id=' + this.gearsCount, {
      method: 'get',
      evalScripts: true,
      insertion: 'bottom',
      onSuccess: function(transport){
      }.bind(this)
    });
    this.gearsCount++;
  },

  isGearNameValid: function(gearID, newGear){
    if(newGear)
      prefix = 'new';
    else
      prefix = 'existing';

    var div = prefix + '_gear_' + gearID + '_name_error';
    var name = $('guild_' + prefix + '_gears_' + gearID + '_name').value;

    this.clearError(div);

    if(name == ''){
      this.showError(div, '名字不能为空');
      return false;
    }

    return true;        
  },

  isGearCostValid: function(gearID, newGear){
    if(newGear)
      prefix = 'new';
    else
      prefix = 'existing';

    var div = prefix + '_gear_' + gearID + '_cost_error';
    var cost = $('guild_' + prefix + '_gears_' + gearID + '_cost').value;

    this.clearError(div);

    if(cost == ''){
      this.showError(div, '奖励不能为空');
      return false;
    }else{
      cost = parseInt(cost);
      if(!cost){
        this.showError(div, '奖励不合法');
        return false;
      }else if(cost <= 0){
        this.showError(div, '奖励必须是正数');
        return false;
      }
    }

    return true;
  },

  validateGears: function(){
    var valid = true;
    var inputs = $('gears_form').getInputs();

    inputs.each(function(input){
      if(input.type != 'text')
        return;
      var inputID = input.id;
      var newGear = null;
      if(inputID.match(/new/))
        newGear = true;
      else
        newGear = false;
      var id = inputID.match(/\d+/)[0];
      if(inputID.match(/name/))
        valid &= this.isGearNameValid(id, newGear);
      else
        valid &= this.isGearCostValid(id, newGear);
    }.bind(this));

    return valid;
  },

  updateGears: function(guildID, event){
    Event.stop(event);
    if(this.validateGears()){
      var delParams = '';
      for(var i=0; i < this.delGearIDs.length; i++){
        delParams += "guild[del_gears][]=" + this.delGearIDs[i] + "&";
      }
      new Ajax.Request('/guilds/' + guildID + '/gears/create_or_update', {
        method: 'post',
        parameters: delParams + $('gears_form').serialize(),
        onSuccess: function(transport){
          $('gear_frame').innerHTML = transport.responseText;
          this.editGearsHTML = null;
          this.delGearIDs = new Array();
        }.bind(this)
      });
    }
  },

  cancelEditGears: function(guildID){
    $('gear_frame').innerHTML = this.gearsHTML;
    this.delGearIDs = new Array();
  },

  removeGear: function(gearID, newGear){
    if(newGear)
      prefix = 'new';
    else
      prefix = 'existing';

    if(!newGear)
      this.delGearIDs.push(gearID);
    
    $(prefix + '_gear_' + gearID).remove();
  },

});
