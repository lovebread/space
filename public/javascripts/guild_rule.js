Iyxzone.GuildRule = {
	Editor: {}
};

Object.extend(Iyxzone.GuildRule.Editor, {
  loading: function(div){
    div.innerHTML = "<img src='/images/loading.gif'/>";
  },

	oldAttendanceRule: null,

  oldBasicRule: null,

	oldBossRule: null,

	oldGearRule: null,

	editBasicRule: function(guildID){
		var basicRule = $('basic_rule');
    this.oldBasicRule = basicRule.innerHTML;
		this.loading(basicRule);
    new Ajax.Request('/guilds/' + guildID + '/guild_rules?type=1', {
      method: 'get',
      onSuccess: function(transport){
        this.basicRuleForm = transport.responseText;
        basicRule.innerHTML = this.basicRuleForm;
      }.bind(this)
    });
	},

	addBasicRule: function(guildID){
		var basicRule = $('basic_rule');
    this.oldBasicRule = basicRule.innerHTML;
		this.loading(basicRule);
    new Ajax.Request('/guilds/' + guildID + '/guild_rules/new', {
      method: 'get',
      onSuccess: function(transport){
        this.basicRuleForm = transport.responseText;
        basicRule.innerHTML = this.basicRuleForm;
      }.bind(this)
    });
	},

	editBossRule: function(guildID){
		var bossRule = $('boss_rule');
    this.oldBossRule = bossRule.innerHTML;
		this.loading(bossRule);
    new Ajax.Request('/guilds/' + guildID + '/bosses/edit', {
      method: 'get',
      onSuccess: function(transport){
        this.bossRuleForm = transport.responseText;
        bossRule.innerHTML = this.bossRuleForm;
      }.bind(this)
    });
	},

	addBossRule: function(guildID){
		var bossRule = $('boss_rule');
    this.oldBossRule = bossRule.innerHTML;
		this.loading(bossRule);
    new Ajax.Request('/guilds/' + guildID + '/bosses/new', {
      method: 'get',
      onSuccess: function(transport){
        this.bossRuleForm = transport.responseText;
        bossRule.innerHTML = this.bossRuleForm;
      }.bind(this)
    });
	},

	editGearRule: function(guildID){
		var gearRule = $('gear_rule');
    this.oldGearRule = gearRule.innerHTML;
		this.loading(gearRule);
    new Ajax.Request('/guilds/' + guildID + '/gears/edit', {
      method: 'get',
      onSuccess: function(transport){
        this.gearRuleForm = transport.responseText;
        gearRule.innerHTML = this.gearRuleForm;
      }.bind(this)
    });
	},

	addGearRule: function(guildID){
		var gearRule = $('gear_rule');
    this.oldGearRule = gearRule.innerHTML;
		this.loading(gearRule);
    new Ajax.Request('/guilds/' + guildID + '/gears/new', {
      method: 'get',
      onSuccess: function(transport){
        this.gearRuleForm = transport.responseText;
        gearRule.innerHTML = this.gearRuleForm;
      }.bind(this)
    });
	},

	editAttendanceRule: function(guildID){
		var attendanceRule = $('attendance_rule');
    this.oldAttendanceRule = attendanceRule.innerHTML;
		this.loading(attendanceRule);
    new Ajax.Request('/guilds/' + guildID + '/guild_rules?type=2', {
      method: 'get',
      onSuccess: function(transport){
        this.basicAttendanceForm = transport.responseText;
        attendanceRule.innerHTML = this.basicAttendanceForm;
      }.bind(this)
    });
	},

  cancelEditBasicRule: function(){
    var basicRule = $('basic_rule');
    basicRule.innerHTML = this.oldBasicRule;
  },
	
	validateBasicRule: function(size){
		for (i=0;i<size;i++){
			var reason = $('guild_guild_rules_attributes_'+i+'_reason');
			var outcome = $('guild_guild_rules_attributes_'+i+'_outcome');

			if (reason.value == '' && outcome.value != ''){
				error('必须填写原因');
				return false;
			}
/*
		if (!outcome.value.to_i.is_a?(Integer)){
			error('加减分必须为整数')；
			return false;
		}
*/
		}
		return true;
	},
	
	removeBasicRule: function(link){
		link.up().remove();
	},

	updateBasicRule: function(guildID, button, size){
    if(this.validateBasicRule(size)){
      new Ajax.Request('/guilds/' + guildID + '/guild_rules/update_rules?type=1', {
        method: 'put',
        parameters: $('basic_rule_form').serialize(),
        onLoading: function(){
          Iyxzone.disableButton(button, '等待...');
        },
        onComplete: function(){
          Iyxzone.enableButton(button, '保存');
        },
        onSuccess: function(transport){
          var basicInfoBody = $('basic_rule');
          basicInfoBody.innerHTML = transport.responseText;
        }.bind(this)
      });
    }
	},

	validateBossRule: function(size){
		for (i=0;i<size;i++){
			var reason = $('guild_bosses_attributes_'+i+'_name');
			var reward = $('guild_bosses_attributes_'+i+'_reward');

			if (name.value == '' && reward.value != ''){
				error('必须填写原因');
				return false;
			}
		}
		return true;
	},
  
	cancelEditBossRule: function(){
    var bossRule = $('boss_rule');
    bossRule.innerHTML = this.oldBossRule;
  },

	updateBossRule: function(guildID, button, size){
    if(this.validateBossRule(size)){
      new Ajax.Request('/guilds/' + guildID + '/bosses/update', {
        method: 'put',
        parameters: $('boss_form').serialize(),
        onLoading: function(){
          Iyxzone.disableButton(button, '等待...');
        },
        onComplete: function(){
          Iyxzone.enableButton(button, '保存');
        },
        onSuccess: function(transport){
          var bossInfoBody = $('boss_rule');
          bossInfoBody.innerHTML = transport.responseText;
        }.bind(this)
      });
    }
	},

	validateGearRule: function(size){
		for (i=0;i<size;i++){
			var reason = $('guild_gears_attributes_'+i+'_name');
			var cost = $('guild_gears_attributes_'+i+'_cost');

			if (name.value == '' && cost.value != ''){
				error('必须填写原因');
				return false;
			}
		}
		return true;
	},
  
	cancelEditGearRule: function(){
    var gearRule = $('gear_rule');
    gearRule.innerHTML = this.oldGearRule;
  },

	updateGearRule: function(guildID, button, size){
    if(this.validateGearRule(size)){
      new Ajax.Request('/guilds/' + guildID + '/gears/update', {
        method: 'put',
        parameters: $('gear_form').serialize(),
        onLoading: function(){
          Iyxzone.disableButton(button, '等待...');
        },
        onComplete: function(){
          Iyxzone.enableButton(button, '保存');
        },
        onSuccess: function(transport){
          var gearInfoBody = $('gear_rule');
          gearInfoBody.innerHTML = transport.responseText;
        }.bind(this)
      });
    }
	},

	validateNewBasicRule: function(){
		return true;
	},

	createBasicRule: function(guildID, button){
    if(this.validateNewBasicRule()){
      new Ajax.Request('/guilds/' + guildID + '/guild_rules/', {
        method: 'post',
        parameters: $('add_basic_rule_form').serialize(),
        onLoading: function(){
          Iyxzone.disableButton(button, '等待...');
        },
        onComplete: function(){
          Iyxzone.enableButton(button, '保存');
        },
        onSuccess: function(transport){
          var basicInfoBody = $('basic_rule');
          basicInfoBody.innerHTML = transport.responseText;
        }.bind(this)
      });
    }
	},

	validateNewBossRule: function(){
		return true;
	},

	createBossRule: function(guildID, button){
    if(this.validateNewBossRule()){
      new Ajax.Request('/guilds/' + guildID + '/bosses/', {
        method: 'post',
        parameters: $('add_boss_form').serialize(),
        onLoading: function(){
          Iyxzone.disableButton(button, '等待...');
        },
        onComplete: function(){
          Iyxzone.enableButton(button, '保存');
        },
        onSuccess: function(transport){
          var bossInfoBody = $('boss_rule');
          bossInfoBody.innerHTML = transport.responseText;
        }.bind(this)
      });
    }
	},

	validateNewGearRule: function(){
		return true;
	},

	createGearRule: function(guildID, button){
    if(this.validateNewGearRule()){
      new Ajax.Request('/guilds/' + guildID + '/gears/', {
        method: 'post',
        parameters: $('add_gear_form').serialize(),
        onLoading: function(){
          Iyxzone.disableButton(button, '等待...');
        },
        onComplete: function(){
          Iyxzone.enableButton(button, '保存');
        },
        onSuccess: function(transport){
          var gearInfoBody = $('gear_rule');
          gearInfoBody.innerHTML = transport.responseText;
        }.bind(this)
      });
    }
	},

	validateAttendanceRule: function(){
		return true;
	},

	updateAttendanceRule: function(guildID, button, size){
    if(this.validateAttendanceRule()){
      new Ajax.Request('/guilds/' + guildID + '/guild_rules/update_rules?type=2', {
        method: 'put',
        parameters: $('attendance_rule_form').serialize(),
        onLoading: function(){
          Iyxzone.disableButton(button, '等待...');
        },
        onComplete: function(){
          Iyxzone.enableButton(button, '保存');
        },
        onSuccess: function(transport){
          var basicInfoBody = $('attendance_rule');
          basicInfoBody.innerHTML = transport.responseText;
        }.bind(this)
      });
    }
	},

  cancelEditAttendanceRule: function(){
    var attendanceRule = $('attendance_rule');
    attendanceRule.innerHTML = this.oldAttendanceRule;
  },
}); 
