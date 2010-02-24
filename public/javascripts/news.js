Iyxzone.News = {
  version: '1.0',
  author: ['李玉山'],
  Builder: {}
};

Object.extend(Iyxzone.News.Builder, {

  editor:null,

  validate: function() {
    if ($('news_title').value == '') {
      error("请填写标题")
      return false;
    }
    if ($('news_title').length > 64) {
      error("标题最长为64个字符")
      return false;
    }
    if ($('news_game_id').value == '') {
      error("请选择与新闻相关的游戏")
      return false;
    }
    return true;
  },

  prepare: function() {
    for(var i=0; i<this.editor.nicInstances.length; i++) {
      this.editor.nicInstances[i].saveContent();
    }
    this.parameters = $('news_form').serialize();
  },

  saveNews: function(event){
    Event.stop(event);
    if (this.validate()) {
      this.prepare();
      new Ajax.Request('/admin/news/create', {
        method: 'post',
        parameters: this.parameters,
      });
    }
  },

  updateNews: function(blogID, event){
    Event.stop(event);
    if (this.validate()) {
      this.prepare();
      new Ajax.Request('/admin/news/update/' + blogID, {
        method: 'put',
        parameters: this.parameters,
      });
    }
  },

  expand: function(data){
    $('news-data').innerHTML = data;
    $('news-expand').hide();
    $('news-hide').show();
  },

  hide: function(data){
    $('news-data').innerHTML = data;
    $('news-expand').show();
    $('news-hide').show();
  }
});
