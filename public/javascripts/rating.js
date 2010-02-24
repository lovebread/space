Iyxzone.Rating = {
  version: '1.0',
  author: ['高侠鸿']
};

Object.extend(Iyxzone.Rating, {
  
  set: function(rating, rateableID, rateableType, link){
    var stars = link.up().childElements();
    var i = 0;
    for(i=0; i < stars.length; i++){
      if(i < rating)
        stars[i].className = 'lit';
      else
        stars[i].className = '';
    }
    $(rateableType + '_' + rateableID + '_rating').value = rating;
  },

});
