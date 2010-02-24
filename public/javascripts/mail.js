Iyxzone.Mail = {
  version: '1.0',
  author: ['高侠鸿'],
  Manager: {},
  Builder: {}
};

Object.extend(Iyxzone.Mail.Manager, {

  deselectAllMails: function(){
    var inputs = $$('input');
    for(var i=0;i<inputs.length;i++){
      if(inputs[i].type == 'checkbox' && inputs[i].hasClassName('mail-check')){
        inputs[i].checked = false;
      }
    }
  },

  selectAllMails: function(){
    var inputs = $$('input');
    for(var i=0;i<inputs.length;i++){
      if(inputs[i].type == 'checkbox' && inputs[i].hasClassName('mail-check')){
        inputs[i].checked = true;
      }
    }
  },

  selectReadMails: function(){
    var inputs = $$('input');
    for(var i=0;i<inputs.length;i++){
      if(inputs[i].type == 'checkbox' && inputs[i].hasClassName('mail-check') && inputs[i].readAttribute('read') == 'true'){
        inputs[i].checked = true;
      }
    }
  },

  selectUnreadMails: function(){
    var inputs = $$('input');
    for(var i=0;i<inputs.length;i++){
      if(inputs[i].type == 'checkbox' && inputs[i].hasClassName('mail-check') && inputs[i].readAttribute('read') == 'false'){
        inputs[i].checked = true;
      }
    }
  },

  onDropdownChange: function(){
    this.deselectAllMails();
    var val = $('select').value;
    if(val == 'all'){
      this.selectAllMails();
    }else if(val == 'none'){
    }else if(val == 'read'){
      this.selectReadMails();
    }else if(val == 'unread'){
      this.selectUnreadMails();
    }
  },

  getSelectedMailIDs: function(){
    var ids = [];
    var inputs = $$('input');
    for(var i=0;i<inputs.length;i++){
      if(inputs[i].type == 'checkbox' && inputs[i].hasClassName('mail-check') && inputs[i].checked){
        ids.push(inputs[i].readAttribute('mail_id'));
      }
    }
    return ids;
  },

  read: function(authenticity_token){
    var ids = this.getSelectedMailIDs();
    var params = "";
    for(var i=0;i<ids.length;i++){
      params += "ids[]=" + ids[i] + "&";
    }
    params += "authenticity_token=" + authenticity_token + "&";
    params += "type=1"; // type=1 means it's inbox...
    new Ajax.Request('/mails/read_multiple', {
      method: 'put',
      parameters: params,
      onSuccess: function(transport){
        for(var i=0;i<ids.length;i++){
          $('mail_' + ids[i] + '_title').style.fontWeight = '';
          $('mail_' + ids[i] + '_select').writeAttribute({read: 'true'});
        }
      }
    });
  },

  unread: function(authenticity_token){
    var ids = this.getSelectedMailIDs();
    var params = "";
    for(var i=0;i<ids.length;i++){
      params += "ids[]=" + ids[i] + "&";
    }
    params += "authenticity_token=" + authenticity_token + "&";
    params += "type=1"; //inbox
    new Ajax.Request('/mails/unread_multiple', {
      method: 'put',
      parameters: params,
      onSuccess: function(transport){
        for(var i=0;i<ids.length;i++){
          $('mail_' + ids[i] + '_title').style.fontWeight = 'bold';
          $('mail_' + ids[i] + '_select').writeAttribute({read: 'false'});
        }
      }
    });
  },

  destroy: function(authenticity_token, type){
    var ids = this.getSelectedMailIDs();
    var params = "";
    for(var i=0;i<ids.length;i++){
      params += "ids[]=" + ids[i] + "&";
    }
    params += "authenticity_token=" + authenticity_token + "&";
    params += "type=" + type;
    new Ajax.Request('/mails/destroy_multiple', {
      method: 'delete',
      parameters: params
    });
  }

});


Object.extend(Iyxzone.Mail.Builder, {

  recipientBuilder: null, // initialize this in your page

  validate: function(){
    if(this.recipientBuilder.getNewTags().length == 0){
      error('至少要有1个收件者');
      return false;
    }
    if($('mail_title').value == ''){
      error('标题不能为空');
      return false;
    }
    if($('mail_content').value == ''){
      error('内容不能为空');
      return false;
    }

    return true;

  },

  deliver: function(button){
    if(this.validate()){
      var newTags = this.recipientBuilder.getNewTags();
      for(var i=0;i<newTags.length;i++){
        var el = new Element("input", {type: 'hidden', value: newTags[i], id: 'recipient_ids[]', name: 'recipient_ids[]' });
        $('mail_form').appendChild(el);
      }
      Iyxzone.disableButton(button, '等待...'); 
      $('mail_form').submit();
    }  
  },

});
