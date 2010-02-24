Iyxzone.Menu = {
  version: '1.0',
  author: ['高侠鸿'],
  Dropdown: Class.create({}),
  AjaxDropdown: Class.create({})
};

/*
 * 这个比较简单，
 * 显示一段html
 */
Iyxzone.Menu.Dropdown = Class.create({

  initialize: function(root, menu){
    this.root = $(root);
    this.menu = $(menu);

    Event.observe(this.root, 'click', function(e){
      this.toggleMenu(e);
    }.bind(this));

    Event.observe(document.body, 'click', function(e){
      this.menu.hide();
    }.bind(this));

  },

  toggleMenu: function(e){
    if(this.menu.visible()){
      this.menu.hide();
    }else{
      Event.stop(e);
      this.menu.show();
    }
  }

});

/*
 * 用ajax取得内容填到菜单里
 */
Iyxzone.Menu.AjaxDropdown = Class.create({

  initialize: function(root, container, update, url){
    this.root = $(root);
    this.update = $(update);
    this.container = $(container);
    this.url = url;

    Event.observe(this.root, 'click', function(e){
      this.toggleMenu(e);
    }.bind(this));

    Event.observe(document.body, 'click', function(e){
      this.container.hide();
    }.bind(this));
  },

  toggleMenu: function(e){
    if(this.container.visible()){
      this.container.hide();
    }else{
      Event.stop(e);
      this.container.show();
      if(this.update.innerHTML == ''){
        this.update.innerHTML = '<img src="/images/loading.gif />';
        new Ajax.Request(this.url, {
          method: 'get',
          onSuccess: function(transport){
            this.update.innerHTML = transport.responseText;
          }.bind(this)
        });
      }
    }
  }

});
