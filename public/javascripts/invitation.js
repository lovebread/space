/**
 * this only workds for event & guild & poll
 */
Iyxzone.Invitation = {
  version: '1.0',

  author: ['高侠鸿'],

  Builder: {}  

};

Object.extend(Iyxzone.Invitation.Builder, {

  selected: new Hash(),

  onClick: function(td, characterID, userID){
    if(this.selected.get(characterID)){
      td.setStyle({background: 'white'});
      this.selected.unset(characterID);
    }else{
      this.selected.set(characterID, userID)
      td.setStyle({background: '#526ea6'});
    } 
  },
  
  onMouseOver: function(td, characterID){
    if(!this.selected.get(characterID)){
      td.setStyle({background: '#e7ebf5'});
    }
  },

  onMouseOut: function(td, characterID){
    if(!this.selected.get(characterID)){
      td.setStyle({background: 'white'});
    }
  },

  submit: function(form){
    form.action += '?';
    if(this.selected.size() == 0){
      error('你必须至少邀请一个游戏角色');
    }else{
      this.selected.each( function(pair){
        var el = new Element("input", {type: 'hidden', value: pair.key, id: 'invitations[][character_id]', name: 'invitations[][character_id]'})
        form.appendChild(el);
        el = new Element("input", {type: 'hidden', value: pair.value, id: 'invitations[][user_id]', name: 'invitations[][user_id]'})
        form.appendChild(el);
      });
      form.submit();
    }
  },

  reset: function(){
    this.selected = new Hash();
  }

});
