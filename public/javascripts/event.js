Iyxzone.Event = {
  version: '1.0',
  author: ['高侠鸿'],
  Builder: {},
  Summary: {}
};

Object.extend(Iyxzone.Event.Builder, {

  gameSelector: null, 

  validate: function(onCreate){
    var title = $('event_title');
    if(title.value == ''){
      error('标题不能为空');
      return false;
    }
    if(title.value.length > 100){
      error('标题太长，最长100个字符');
      return false;
    }

    var description = $('event_description');
    if(description.value == ''){
      error('描述不能为空');
      return false;
    }
    if(description.value.length > 10000){
      error('描述最长10000个字符');
      return false;
    }

    var startTime = $('event_start_time');
    var endTime = $('event_end_time');
    if(startTime.value == ''){
      error('开始时间不能为空');
      return false;
    }
    if(endTime.value == ''){
      error('结束时间不能为空');
      return false;
    }

    var currentTimeJS = new Date().getTime();
    var startTimeJS = new Date(startTime.value).getTime();
    var endTimeJS = new Date(endTime.value).getTime();
    if(startTimeJS < currentTimeJS){
      error('开始时间不能比现在早');
      return false;
    }
    if(endTimeJS <= startTimeJS){
      error('结束时间不能比开始时间早');
      return false;
    }

    if(onCreate){
      var is_guild_event = $('is_guild_event').checked;
      if(is_guild_event){
        var guild_id = $('event_guild_id').value;
        if(guild_id == ''){
          error('工会活动必须选择工会');
          return false;
        }
      }
      
      var character_id = $('event_character_id').value;
      if(character_id == ''){
        error('游戏角色必须选择');
        return false
      }
    }

    return true;
  },

  save: function(event){
    Event.stop(event);
    if(this.validate(true)){
      var form = $('event_form');
      form.action = '/events';
      form.method = 'post';
      form.submit();
    }
  },

  update: function(eventID, event){
    Event.stop(event);
    if(this.validate(false)){
      var form = $('event_form');
      form.action = '/events/' + eventID;
      form.method = 'put';
      form.submit();
    }
  },

  userCharactersHTML: null,

  checkGuild: function(checkBox){
    if(checkBox.checked){
      this.userCharactersHTML = $('event_character_id').innerHTML;
      $('event_guild_selector').show();
      $('event_guild_id').value = '';
      $('event_character_id').innerHTML = "<option value=''>---</option>";
    }else{
      $('event_guild_id').value = '';
      $('event_guild_selector').hide();
      $('event_character_id').innerHTML = this.userCharactersHTML;
    }
  },

  guildOnChange: function(guildID){
    if(guildID == ''){
      $('event_character_id').innerHTML = "<option value=''>---</option>";
      return;
    }

    new Ajax.Request('/guilds/' + guildID + '/characters', {
      method: 'get',
      onSuccess: function(transport){
        var characters = transport.responseText.evalJSON();
        var selector = new Element('select');
        $('event_character_id').innerHTML = "<option value=''>---</option>";
        for(var i=0;i <characters.length;i++){
          var option = new Element('option', {value: characters[i].game_character.id}).update(characters[i].game_character.name);
          Element.insert($('event_character_id'), {bottom: option});
        }
      }.bind(this)
    });
  },

  reset: function(){
    $('event_character_id').value = '';
    $('is_guild_event').checked = false;
  }

});

Object.extend(Iyxzone.Event.Summary, {

  Attendance : {},

  Boss : {},

  Gear : {},

  Reward : {}

});

Object.extend(Iyxzone.Event.Summary.Attendance, {

  summary: new Hash(), // character_id => { late => boolean, completeness => percentage}

  eventID: null,

  token: null,

  load: function(eventID, token, characterIDs, lates, completeness){
    this.eventID = eventID;
    this.token = token;
    for(var i=0;i<characterIDs.length;i++)
      this.summary.set(characterIDs[i], {late: lates[i], completeness: completeness[i]});
  },

  reset: function(){
    $$('input').each(function(input){
      if(input.type == 'checkbox' && input.readAttribute('character_id') != null){
        input.checked = false;
        if(this.summary.keys().include(input.readAttribute('character_id'))){
          input.checked = true;
        }
      }
    }.bind(this));

    this.summary.keys().each(function(id){
      $('late_' + id).checked = this.summary.get(id).late;
    }.bind(this));

    setTimeout(this.save.bind(this), 20000);
  },

  incCompleteness: function(characterID){
    var el = $('completeness_' + characterID + '_bar');
    if(el == null)
      return;
 
    var num = parseInt(el.style.width);
    if(num < 100){
      num += 10;
    }
    
    $('completeness_' + characterID + '_bar').setStyle({width: num + '%'});
    $('completeness_' + characterID + '_number').update(num + '%');
    
    var info = this.summary.get(characterID);
    info.completeness = num;
    this.summary.set(characterID, info);
  },

  decCompleteness: function(characterID){
    var el = $('completeness_' + characterID + '_bar');
    if(el == null)
      return;

    var num = parseInt(el.style.width);
    if(num > 0){
      num -= 10;
    }

    $('completeness_' + characterID + '_bar').setStyle({width: num + '%'});
    $('completeness_' + characterID + '_number').update(num + '%');
  
    var info = this.summary.get(characterID);
    info.completeness = num;
    this.summary.set(characterID, info);
  },

  lateOnchange: function(characterID){
    var info = this.summary.get(characterID);
    info.late = !info.late;
    this.summary.set(characterID, info); 
  },

  selectCharacters: function(){
    $('friend-wrap').toggle();
  },

  resetCharacters: function(){
    var newCharacterIds = [];
    var delCharacterIds = [];
    var characterIds = [];
    var params;
    $$('input').each(function(e){
      if(e.type == 'checkbox' && e.readAttribute('character_id') && e.checked)
        characterIds.push(e.readAttribute('character_id'));
    });

    this.summary.keys().each(function(k){
      if(!characterIds.include(k))
        delCharacterIds.push(k);
    }.bind(this));

    characterIds.each(function(k){
      if(!this.summary.keys().include(k))
        newCharacterIds.push(k)
    }.bind(this));

    params = "";
    delCharacterIds.each(function(id){
      params += "character_ids[]=" + id + "&";
    });

    if(params != ""){
    new Ajax.Request('/user/events/summary/remove_attendants?step=1&event_id=' + this.eventID, {
      method: 'get',
      parameters: params,
      onSuccess: function(){
        delCharacterIds.each(function(id){
          this.summary.unset(id);
          $('character_' + id).remove();
          $('friend-wrap').hide();
        }.bind(this));
      }.bind(this)
    });
    }

    params = "";
    newCharacterIds.each(function(id){
      params += "character_ids[]=" + id + "&";
    });

    if(params != ""){
    new Ajax.Updater('attendants', '/user/events/summary/add_attendants?step=1&event_id=' + this.eventID, { 
      method: 'get',
      parameters: params,
      insertion: 'bottom',
      onSuccess: function(){
        newCharacterIds.each(function(id){
          this.summary.set(id, {late: false, completeness: 50});
        }.bind(this));
        $('friend-wrap').hide();
      }.bind(this)
    });
    }
  },

  save: function(){
    var params = '';
    this.summary.each(function(pair){
      params += 'characters[' + pair.key + '][late]=' + pair.value.late + '&characters[' + pair.key + '][completeness]=' + pair.value.completeness + '&';
    });
    new Ajax.Request('/user/events/summary/save?step=1&event_id=' + this.eventID + '&authenticity_token=' + encodeURIComponent(this.token), {
      method: 'post',
      parameters: params,
      onSuccess: function(){
        setTimeout(this.save.bind(this), 20000);
      }.bind(this)
    });
  },

  remove: function(characterID){
    new Ajax.Request('/user/events/summary/remove_attendants?step=1&event_id=' + this.eventID, {
      method: 'get',
      parameters: "character_ids[]=" + characterID,
      onSuccess: function(){
        this.summary.unset(characterID);
        new Effect.BlindUp($('character_' + characterID));
        $$('input').each(function(input){
          if(input.type == 'checkbox' && input.readAttribute('character_id') != null){
            input.checked = false;
            if(this.summary.keys().include(input.readAttribute('character_id'))){
              input.checked = true;
            }
          }
        }.bind(this));
      }.bind(this)
    });
  },

  next: function(){
    var params = '';
    this.summary.each(function(pair){
      params += 'characters[' + pair.key + '][late]=' + pair.value.late + '&characters[' + pair.key + '][completeness]=' + pair.value.completeness + '&';
    });
    new Ajax.Request('/events/' + this.eventID + '/summary/next?step=1&authenticity_token=' + encodeURIComponent(this.token), {
      method: 'post',
      parameters: params
    });
  }

});

Object.extend(Iyxzone.Event.Summary.Boss, {

  summary: new Array(),

  eventID: null,

  guildID: null,

  token: null,

  id: null,

  load: function(eventID, guildID, token, ids, bossIDs, counts){
    this.eventID = eventID;
    this.guildID = guildID;
    this.token = token;
    this.id = ids[ids.length - 1] + 1;

    for(var i=0;i<ids.length;i++){
      this.summary.push({id: ids[i], bossID: bossIDs[i], count: counts[i]});
    }
  },

  reset: function(){
    $$('input').each(function(input){
      if(input.type == 'checkbox' && input.readAttribute('boss_id')){
        input.checked = false;
        if(this.summary.keys().include(input.readAttribute('boss_id')))
          input.checked = true;
      }
    }.bind(this));
  },

  selectBosses: function(){
    $('friend-wrap').toggle();
  },

  addBosses: function(){
    var params = "";
    var bosses = new Array();    

    $$('input').each(function(e){
      if(e.type == 'checkbox' && e.readAttribute('boss_id') && e.checked){
        bosses.push({id: this.id, bossID: e.readAttribute('boss_id'), count: 1});
        this.id++;
      }
    });
   
    bosses.each(function(v){
      params += "bosses[" + v.id + "][boss_id]=" + v.bossID + "&";
    });

    if(params != ""){
      new Ajax.Request('/user/events/summary/add_bosses?step=2&event_id=' + this.eventID, {
        method: 'get',
        parameters: params,
        onSuccess: function(transport){
          $('friend-wrap').hide();
          Element.insert($('bosses'), {bottom: transport.responseText});
          bosses.each(function(v){
            this.summary.push(v);
          }.bind(this));
          this.resetBosses();
        }.bind(this)
      });
    }

  },

  remove: function(id){
    new Ajax.Request('/user/events/summary/remove_bosses?step=2&event_id=' + this.eventID, {
      method: 'get',
      parameters: "ids[]=" + id,
      onSuccess: function(){
        for(var i=0;i<this.summary.length;i++){
          if(this.summary[i].id == id){
            this.summary.splice(i,1);
          }
        }
        new Effect.BlindUp($('boss_' + id));
      }.bind(this)
    });
  },

  next: function(){
    new Ajax.Request('/user/events/summary/next?step=2&event_id=' + this.eventID, {
      method: 'post',
      parameters: 'authenticity_token=' + encodeURIComponent(this.token)
    });
  },

  prev: function(){
    new Ajax.Request('/user/events/summary/prev?step=2&event_id=' + this.eventID, {
      method: 'post',
      parameters: 'authenticity_token=' + encodeURIComponent(this.token)
    });
  },

  newBoss: function(){
    $('new_boss').hide();
    $('new_boss_name').show();
    $('boss_name').value = '输入BOSS名字';
    $('new_boss_reward').show();
    $('boss_reward').value = '输入BOSS分值';
    $('new_boss_submit').show();
  },

  cancelBoss: function(){
    $('new_boss_name').hide();
    $('new_boss_reward').hide();
    $('new_boss_submit').hide();
    $('new_boss').show();
  },
 
  validateBoss: function(){
    if($('boss_name').value == ''){
      error('必须输入名字');
      return false;
    }
    if($('boss_reward').value == ''){
      error('必须输入奖励');
      return false;
    }else{
      var reward = parseInt($('boss_reward'));
      if(reward == null){
        error('奖励必须是整数');
        return false;
      }else if(reward <= 0){
        error('奖励必须是正数');
        return false;
      }
    }

    return true;
  },

  createBoss: function(){
    if(this.validateBoss()){
      new Ajax.Request('/guilds/' + this.guildID + '/bosses?authenticity_token=' + encodeURIComponent(this.token), {
        method: 'post',
        parameters: 'boss[name]=' + $('boss_name').value + '&boss[reward]=' + $('boss_reward').value,
        onSuccess: function(transport){
          this.cancelBoss();
          var boss = transport.responseText.evalJSON().boss;
          var bossList = $$('ul.checkboxes')[0];
          var html = "<li><span><input type='checkbox' checked=1 value=1 boss_id='" + boss.id + "'/>" + boss.name + "-" + boss.reward + "</span></li>";
          Element.insert(bossList, {bottom: html});
          this.resetBosses();
        }.bind(this)
      });
    }
  }

});

Object.extend(Iyxzone.Event.Summary.Gear, {

});

Object.extend(Iyxzone.Event.Summary.Reward, {

});

