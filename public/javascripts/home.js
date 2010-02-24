Iyxzone.Home = {

  version: '1.0',

  author: ['高侠鸿'],

  Feeder: {},

  NoticeManager: {}

};

Object.extend(Iyxzone.Home.NoticeManager, {

  fetch: function(){
    new Ajax.Request('notices/first_ten', {
      method: 'get',
      onSuccess: function(transport){
        $('my_notices').innerHTML = transport.responseText;
      }.bind(this)
    });
  },

  read: function(noticeID, token){
    new Ajax.Request('/notices/' + noticeID + '/read', {
      method: 'put',
      parameters: "authenticity_token=" + encodeURIComponent(token),
      onSuccess: function(transport){
        $('my_notices').innerHTML = transport.responseText;
      }.bind(this)
    });
  }

});

Object.extend(Iyxzone.Home.Feeder, {
  
  idx: 0, 

  type: null,

  loading: function(div){
    div.innerHTML = "<div style='textAligin: center'><img src='/images/loading.gif'/></div>";
  },

  showFeeds: function(type){
    var feedCategories = $('feed_menu').childElements();
    
    for(var i=0;i < feedCategories.length;i++)
      feedCategories[i].className = '';
    if(type == null){
      feedCategories[0].className = 'hover';
    }else{
      feedCategories[type+1].className = 'hover';
    }
    
    this.idx = 0;
    this.type = type;
    $('feed_list').innerHTML = '';
    this.loading($('more_feed'));
    
    if(type != nil){
      new Ajax.Request('/home/feeds?type=' + type, {method: 'get'});
    }else{
      new Ajax.Request('/home/feeds', {method: 'get'});
    }
  },

  moreFeeds: function(){
    if(this.type != nil){
      new Ajax.Request('/home/more_feeds?type=' + this.type + '&idx=' + this.idx, {
        method: 'get',
        onLoading: function(){
          this.loading($('more_feed'));
        }.bind(this),
        onSuccess: function(transport){
          this.idx++;
        }.bind(this)
      });
    }else{
      new Ajax.Request('/home/more_feeds?idx=' + this.idx, {
        method: 'get',
        onLoading: function(){
          this.loading($('more_feed'));
        }.bind(this),
        onSuccess: function(transport){
          this.idx++;
        }.bind(this)
      });
    }
  },

});
