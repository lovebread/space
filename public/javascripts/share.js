Iyxzone.Share = {
  version: '1.0',
  
  author: ['高侠鸿'],
  
  getPage: function(link){
    this.node = new Element('script', {type: 'text/javascript', src: 'http://www.baidu.com'});
    var head = $('shared_link');
    head.appendChild(this.node);
    alert(this.node.innerHTML);
  },

  validateURL: function(url){
    if(!url.match(/^((https?:\/\/)?)(([a-zA-Z0-9_-])+(\.)?)*(:\d+)?(\/((\.)?(\?)?=?&?[a-zA-Z0-9_-](\?)?)*)*$/)){
      error('非法的url地址');
      return false;
    }
    return true;
  },

  shareLink: function(){
    var url = $('link_url').value;
    if(this.validateURL(url)){
      new Ajax.Request('/sharings/new', {
        method: 'get',
        parameters: 'shareable_type=Link&link[url]=' + url,
        onSuccess: function(transport){
          facebox.reveal(transport.responseText);
        }
      });
    }
  }
};
