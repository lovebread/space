/**
 * TODO:
 * 点击document.body时候，能够触发hideForm事件
 */

Iyxzone.Comment = {
  version: '1.0',
  author: ['高侠鸿']
};

Object.extend(Iyxzone.Comment, {

  mappings: new Hash(),

  pluralize: function(str){
    if(str == 'status')
      return 'statuses';
    else
      return str + 's';
  },

  validate: function(content){
    if(content.value.length == 0){
      error('评论不能为空');
      return false;
    }
    if(content.value.length > 140){
      error('评论最多140个字节');
      return false;
    }
    return true;
  },

  showForm: function(commentableType, commentableID, recipientID, login){
    $('add_' + commentableType + '_comment_' + commentableID).hide();
    $(commentableType + '_comment_' + commentableID).show();
    if(recipientID != null && login != null){
      $(commentableType + '_comment_recipient_' + commentableID).value = recipientID;
      $(commentableType + '_comment_content_' + commentableID).value = "回复" + login + ":";
    }
    $(commentableType + '_comment_content_' + commentableID).focus();
  },

  hideForm: function(commentableType, commentableID, event){
    Event.stop(event);
    $(commentableType + '_comment_' + commentableID).hide();
    $('add_' + commentableType + '_comment_' + commentableID).show();
  },

  save: function(commentableType, commentableID, button, event){
    Event.stop(event);
    if(Iyxzone.Comment.validate($(commentableType + '_comment_content_' + commentableID))){
      new Ajax.Request('/comments', { 
        method: 'post',
        parameters: $(commentableType+'_comment_form_' + commentableID).serialize(),
        onLoading: function(){
          Iyxzone.disableButton(button, '等待');
        },
        onComplete: function(){
          Iyxzone.enableButton(button, '发布');
          $(commentableType + '_comment_' + commentableID).hide();
          $('add_' + commentableType + '_comment_' + commentableID).show();
        }
      });
    }
  },

  set: function(commentableType, commentableID, login, commentorID){
    $(commentableType + '_comment_content_' + commentableID).value = "回复" + login + ":";
    $(commentableType + '_comment_recipient_' + commentableID).value = commentorID;
    $('add_' + commentableType + '_comment_' + commentableID).hide();
    $(commentableType + '_comment_' + commentableID).show();
    $(commentableType + '_comment_content_' + commentableID).focus();
    window.scrollTo(0, $(commentableType + '_comment_content_' + commentableID).cumulativeOffset().top);
  },

  more: function(commentableType, commentableID, link){
    link.innerHTML = '<img src="/images/loading.gif" />';
    new Ajax.Request('/comments?commentable_id=' + commentableID + '&commentable_type=' + commentableType, {
      method: 'get',
      onSuccess: function(transport){
        $(commentableType + '_comments_' + commentableID).innerHTML = transport.responseText;
      }
    });
  },

  toggleBox: function(commentableType, commentableID, link, commentsCount){
    var box = $(commentableType + '_comment_box_' + commentableID);
    if(!box.visible()){
      Effect.BlindDown(box);
      $(commentableType + '_comment_content_' + commentableID).focus();
      if(link){
        link.update('收起回复');
      }
    }else{
      Effect.BlindUp(box);
      if(link){
        link.update(commentsCount + '条回复')
      }
    }
  }

});

Iyxzone.WallMessage = Class.create({});

Object.extend(Iyxzone.WallMessage, {

  validate: function(content){
    if(content.value.length == 0){
      error('留言不能为空');
      return false;
    }
    if(content.value.length > 140){
      error('留言最多140个字节');
      return false;
    }
    return true;  
  },

  save: function(wallType, wallID, button){
    if(Iyxzone.WallMessage.validate($('comment_content'))){
      new Ajax.Request('/wall_messages', {
        method: 'post',
        parameters: $('wall_message_form').serialize(),
        onLoading: function(){
          Iyxzone.disableButton(button, '请等待..');
        },
        onComplete: function(){
          Iyxzone.enableButton(button, '发布');
        },
      });
    } 
  },

  fetch: function(wallType, wallID){
    new Ajax.Request('/wall_messages?wall_type=' + wallType + '&wall_id=' + wallID, {
      method: 'get',
      onLoading: function(){
        $('comments').innerHTML = '<img src="images/loading.gif" />';
      },
      onSuccess: function(transport){
        $('comments').innerHTML = transport.responseText;
      }
    });
  },

  set: function(login, id){
    $('comment_recipient_id').value = id;
    $('comment_content').value = '回复' + login + ':';
    $('comment_content').focus();
  },

});
