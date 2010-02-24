Iyxzone.ChineseRegion = {
  version: '1.0',
  author: ['高侠鸿']
};

Iyxzone.ChineseRegion.Selector = Class.create({

  initialize: function(regionSelectorID, citySelectorID, districtSelectorID, options){
    this.regionSelectorID = regionSelectorID;
    this.citySelectorID = citySelectorID;
    this.districtSelectorID = districtSelectorID;

    this.options = Object.extend({
      onRegionChange: Prototype.emptyFunction,
      onCityChange: Prototype.emptyFunction,
      onDistrictChange: Prototype.emptyFunction
    }, options || {});

    this.setEvents();
  },

  setEvents: function(){
    Event.observe(this.regionSelectorID, 'change', this.onRegionChange.bind(this));
    Event.observe(this.citySelectorID, 'change', this.onCityChange.bind(this));
    Event.observe(this.districtSelectorID, 'change', this.onDistrictChange.bind(this));
  },

  resetCityInfo: function(){
    $(this.citySelectorID).innerHTML = '<option value="">---</option>'; 
  },

  setupCityInfo: function(cities){
    var html = '<option value="">---</option>';
    for(var i=0;i<cities.length;i++){
      html += "<option value='" + cities[i].city.id + "'>" + cities[i].city.name + "</option>";
    }
    $(this.citySelectorID).innerHTML = html;
  },

  resetDistrictInfo: function(){
    $(this.districtSelectorID).innerHTML = '<option value="">---</option>'; 
  },

  setupDistrictInfo: function(districts){
    var html = '<option value="">---</option>';
    for(var i=0;i<districts.length;i++){
      html += "<option value='" + districts[i].district.id + "'>" + districts[i].district.name + "</option>";
    }
    $(this.districtSelectorID).innerHTML = html;
  },

  onRegionChange: function(){
    if(this.regionSelectorID && $(this.regionSelectorID).value == ''){
      this.resetCityInfo();
      this.resetDistrictInfo();
      return;
    }
    new Ajax.Request('/cities', {
      method: 'get',
      parameters: {region_id: $(this.regionSelectorID).value},
      onSuccess: function(transport){
        details = transport.responseText.evalJSON();
        if(this.citySelectorID)
          this.resetCityInfo();
        if(this.districtSelectorID)
          this.resetDistrictInfo();
        if(this.citySelectorID)
          this.setupCityInfo(details);
      
        this.options.onRegionChange($(this.regionSelectorID).value);
      }.bind(this)
    });
  },

  onCityChange: function(){
    if(this.citySelectorID && $(this.citySelectorID).value == ''){
      if(this.citySelectorID)
        this.resetDistrictInfo();
      return;
    }
    new Ajax.Request('/districts', {
      method: 'get',
      parameters: {region_id: $(this.regionSelectorID).value, city_id: $(this.citySelectorID).value},
      onSuccess: function(transport){
        details = transport.responseText.evalJSON();
        if(this.districtSelectorID){
          this.resetDistrictInfo();
          this.setupDistrictInfo(details);
        }

        this.options.onCityChange($(this.citySelectorID).value);
      }.bind(this)
    });
  },

  onDistrictChange: function(){
    if(this.districtSelectorID && $(this.districtSelectorID).value == ''){
      return;
    }
    this.options.onDistrictChange($(this.districtSelectorID).value);
  }

});
