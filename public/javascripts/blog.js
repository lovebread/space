Iyxzone.Blog = {
  version: '1.0',
  author: ['高侠鸿'],
  Builder: {}
};


Object.extend(Iyxzone.Blog.Builder, {

  editor: null, // initialize this in your page

  tagBuilder: null, // initialize this in your page

  validate: function(){
    if($('blog_privilege').value == ''){
      error("清选择权限");
      return false;
    }
    if($('blog_game_id').value == ''){
      error("请选择游戏类别");
      return false;
    }
    if($('blog_title').value == ''){
      error("标题不能为空");
      return false;
    }
    if($('blog_title').length > 100){
      error("标题最长100个字符");
      return false;
    }
    return true;
  },

  prepare: function(){
    // fix nicEdit bug
    for(var i=0;i<this.editor.nicInstances.length;i++){
      this.editor.nicInstances[i].saveContent();
    }
    
    this.parameters = $('blog_form').serialize();
    var newTags = this.tagBuilder.getNewTags();
    var delTags = this.tagBuilder.getDelTags();
    for(var i=0;i<newTags.length;i++){
      this.parameters += "&blog[new_friend_tags][]=" + newTags[i];
    }
    for(var i=0;i<delTags.length;i++){
      this.parameters += "&blog[del_friend_tags][]=" + delTags[i];
    }
  },

  process: function(transport){
    var ret = transport.responseText.evalJSON();alert(transport.responseText);
    this.draftID = ret.draft_id;
    this.tagBuilder.reset(ret.tags);
    tip('保存成功，可以继续写了');
    $('errors').innerHTML = '';
  },

  saveBlog: function(event){
    Event.stop(event);
    if(this.validate()){
      this.prepare();
      new Ajax.Request('/blogs', {
        method: 'post',
        parameters: this.parameters,
      });
    }
  },
  
  saveDraft: function(event){
    Event.stop(event);
    if(this.validate()){
      this.prepare();
      new Ajax.Request('/drafts', {
        method: 'post',
        parameters: this.parameters
      });
    }
  },

  updateBlog: function(blogID, event){
    Event.stop(event);
    if(this.validate()){
      this.prepare();
      new Ajax.Request('/blogs/' + blogID, {
        method: 'put',
        parameters: this.parameters,
      });
    }
  },

  updateDraft: function(draftID, event){
    Event.stop(event);
    if(this.validate()){
      this.prepare();
      new Ajax.Request('/drafts/' + draftID, {
        method: 'put',
        parameters: this.parameters,
        onSuccess: function(transport){
          var ret = transport.responseText.evalJSON();
          this.tagBuilder.reset(ret.tags);
          tip('保存成功，可以继续写了');
          $('errors').innerHTML = '';
        }.bind(this)
      });
    }
  }

});
