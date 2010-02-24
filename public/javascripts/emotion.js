/**
 * TODO:
 * 点击document.body，隐藏表情 
 */

Iyxzone.Emotion = {
  version: '1.0',

  author: ['高侠鸿'],

  faces: ['[-_-]', '[@o@]', '[-|-]', '[o_o]', '[ToT]', '[*_*]'],

  facesCount: 6,

  facesPerRow: 10,

  rows: 1,

  specials: ['/', '.', '*', '+', '?', '|','(', ')', '[', ']', '{', '}', '\\'],

  escape: function(text){},

  Manager: {}

};


Object.extend(Iyxzone.Emotion.Manager, {

  linkToFieldsMappings: new Hash(),

  linkToFacesMappings: new Hash(),

  constructFacesTable: function(link, textField){
    if(textField == null) return;

    // I am a lazy boy... save constants to local variant
    var rows = Iyxzone.Emotion.rows;
    var facesPerRow = Iyxzone.Emotion.facesPerRow;
    var facesCount = Iyxzone.Emotion.facesCount;
    var faces = new Element('table', {class:'face-table'});

    document.body.appendChild(faces);

    // construct faces
    for(var i=0;i<rows;i++){
      var row = new Element('tr');
      for(var j=0;j<facesPerRow && i*facesPerRow + j < facesCount;j++){
        var column = new Element('td');
        var face = new Element('img', {src: "/faces/"+(i*facesPerRow + j)+".gif", width: '20px', height: '20px', class: 'emotion-icon', index: (i*facesPerRow + j)});
        column.appendChild(face);
        row.appendChild(column);
      }
      faces.appendChild(row);
    }

    // locate faces
    faces.setStyle({
      position: 'absolute',
      left: (link.cumulativeOffset().left - 200) + 'px',
      top: (link.cumulativeOffset().top) + 'px',
      width: '200px',
      height: '40px'
    });

    // set click events
    // this must be done after faces are appended in document.body
    var icons = faces.getElementsByClassName('emotion-icon');
    for(var i=0;i<icons.length;i++){
      icons[i].observe('click', function(e){
        var idx = parseInt(e.element().readAttribute('index'));
        textField.value += Iyxzone.Emotion.faces[idx];
        this.toggleFaces(link, textField);
      }.bind(this));
    }

    return faces;
  },

  toggleFaces: function(link, textField){
    // get corresponding faces
    var faces = this.linkToFacesMappings.get(link);

    // if faces table exists, show/hide it
    // otherwise create a new table and bind it to textField
    if(faces && faces.visible()){
      faces.hide();
    }else if(faces && !faces.visible()){
      faces.show();
    }else{
      var faces = this.constructFacesTable(link, textField);
      this.linkToFieldsMappings.set(link, textField);
      this.linkToFacesMappings.set(link, faces);
      faces.show();
    }
  }

});
