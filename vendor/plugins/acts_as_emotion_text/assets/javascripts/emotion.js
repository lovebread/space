EmotionConverter = Class.create({
  
  symbols: ['[-_-]', '[@o@]', '[-|-]', '[o_o]', '[ToT]', '[*_*]'],

	paths: ["/faces/0.gif", "/faces/1.gif", "/faces/2.gif", "/faces/3.gif", "/faces/4.gif", "/faces/5.gif"]

  initialize: function(){
    this.faces_count = 6;
    this.faces_per_row = 10;
    this.rows = this.faces_count/this.faces_per_row + 1;
    this.faces = null;
    this.text_areas = new Hash();
    var specials = ['/', '.', '*', '+', '?', '|','(', ')', '[', ']', '{', '}', '\\'];
    this.exp = new RegExp('(\\' + specials.join('|\\') + ')', 'g');
  },

  bind: function(link, text_area){
    this.text_areas.set(link, $(text_area));
  },

  escape: function(text){
    return text.replace(this.exp, '\\$1');
  },

  hide_faces: function(){
    if(this.faces){
      this.faces.remove();
      document.body.stopObserving('click');
    }
  },

  show_faces: function(link){
    this.faces = new Element('table', {class:'face-table'});
    for(var i=0;i<this.rows;i++){
      var row = new Element('tr');
      for(var j=0;j<this.faces_per_row && i*this.faces_per_row + j < this.faces_count;j++){
        var column = new Element('td');
        var face = new Element('img', {src: this.paths[i*this.faces_per_row + j], width: '20px', height: '20px', index: (i*this.faces_per_row + j)});
        face.observe('click', function(e){
          var index = parseInt(e.target.readAttribute('index'));
          var text_area = this.text_areas.get(link);
          text_area.value += this.symbols[index];
          this.hide_faces();
        }.bind(this));
        column.appendChild(face);
        row.appendChild(column);
      }
      this.faces.appendChild(row);
    }
    this.faces.setStyle({
      position: 'absolute',
      left: (link.positionedOffset().left - 200) + 'px',
      top: (link.positionedOffset().top) + 'px',
      width: '200px',
      height: '40px'
    });
    document.body.appendChild(this.faces);
    this.faces.show();
  }

});

var emotion_converter;

document.observe('dom:loaded', function(){
  emotion_converter = new EmotionConverter();
});
