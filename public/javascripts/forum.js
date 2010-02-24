Iyxzone.Forum = {
  version: '1.0',

  author: ['高侠鸿'],

  editor: null,

  validateTopic: function(){
    if($('topic_subject').value == ''){
      error('标题不能为空');
      return false;
    }
    if($('topic_subject').value.length > 100){
      error('标题最长100个字符');
      return false;
    }
    var content = this.editor.instanceById('topic_content').getContent();
    if(content.length < 6){
      error('内容不能少于6个字符');
      return false;
    }
    if(content.length > 10000){
      error('内容最长10000个字符');
      return false;
    }
    return true;
  },

  validatePost: function(){
    var content = this.editor.instanceById('post_content').getContent();
    if(content.length < 6){
      error('回复不能少于6个字符');
      return false;
    }
    if(content.length > 10000){
      error('回复最长10000个字符');
      return false;
    }
    return true;
  },

  setPost: function(floor, name){
    if(floor)
      this.editor.instanceById('post_content').setContent("<span style='font-size: 14px;font-weight:bold'>回复" + floor + "楼" + name + ":</span><hr/>");
    else
      this.editor.instanceById('post_content').setContent("<span style='font-size: 14px;font-weight:bold'>回复楼主:</span><hr/>"); 
    window.scrollTo(0, $('new_post').positionedOffset().top);
  },

}

