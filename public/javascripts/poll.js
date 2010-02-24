Iyxzone.Poll = {
  version: '1.0',

  author: ['高侠鸿'],

  drawPercentBar: function(width, percent, color, votes) {
    var pixels = width * (percent / 100);
    document.write("<td class='percent'><span class='percent01'><span class='"+color+"' style='width: " + percent + "%'><span/></span></span></td>");
    document.write("<td class='status'>" + votes + "(" + percent + "%)</td>");
  },

  checkMultipleSelection: function(max, checkbox){
    var inputs = $$('input');
    var selected = 0;
    for(var i=0;i<inputs.length;i++){
      if(inputs[i].type == 'checkbox' && inputs[i].checked && inputs[i].readAttribute('id') != 'anonymous')
        selected++;
    }
    if(selected > max){
      tip('你最多只能选' + max + '项');
      checkbox.checked = false;
    }
  }
};


Iyxzone.Poll.Builder = {

  validate: function(){
    var game_id = $('poll_game_id');
    if(game_id.value == ''){
      error('游戏类别不能为空');
      return false;
    }

    var name = $('poll_name');
    if(name.value == ''){
      error('标题不能为空');
      return false;
    }
    if(name.value.length > 100){
      error('标题最长100个字符');
      return false;
    }

    var description = $('poll_description');
    if(description.value.length > 5000){
      error('描述最长5000个字符');
      return false;
    }

    var privilege = $('poll_privilege');
    if(privilege.value == ''){
      error('权限不能为空');
      return false;
    }

    var cnt = this.countAnswers(false);
    if(cnt < 2){
      error('至少要有2个选项');
      return false;
    }
    
    var endDate = $('poll_deadline');
    if($('poll_no_deadline_false').checked && endDate.value == ''){
      error('结束日期不能为空');
      return false;
    }

    var currentTimeJS = new Date().getTime();
    var endTimeJS = new Date(endDate.value).getTime();
    if(endTimeJS <= currentTimeJS){
      error('结束时间不对');
      return false;
    }

    return true;
  },

  save: function(){
    if(this.validate()){
      var form = $('poll_form');
      form.action = '/polls';
      form.submit();
    }
  },

  toggleDescriptionInput: function(){
    $('description').toggle();
  },

  toggleExplanation: function(){
    $('explanation').toggle();
  },

  toggleAdvancedOptions: function(){
    $('advanced_options').toggle();
  },

  showMaxMultiple: function(){
    $('max_multiple_select').show();
  },

  hideMaxMultiple: function(){
    $('max_multiple_select').hide();
  },

  showEndDate: function(){
    $('deadline_select').show();
  },

  hideEndDate: function(){
    $('deadline_select').hide();
  },

  countAnswers: function(allowEmpty){
    var inputs = $$('input');
    var cnt = 0;
    for(var i=0;i<inputs.length;i++){
      if(inputs[i].type == 'text' && inputs[i].readAttribute('id') == 'poll_answers__description'){
        if(allowEmpty)
          cnt++;
        else if(inputs[i].value != '')
          cnt++;
      }
    }
    return cnt;
  },

  changeMaxMultiple: function(){
    var selector = $('max_multiple_select').childElements()[0];
    $('max2').value = selector.value;
  },
  
  removeAnswer: function(link){
    var cnt = this.countAnswers(true);
    if(cnt <= 2){
      error('至少要有2个选项，不能再删除了');
      return;
    }
    link.up().remove();
    var maxSelector = $('max_multiple_select').childElements()[0];
    var originValue = maxSelector.value;
    maxSelector.innerHTML = '';
    if(originValue > cnt - 1){
      originValue = cnt - 1;
    }
    for(var i=0;i<cnt-2;i++){
      var html = '<option value=' + (i+2);
      if(i+2 == originValue){
        html += ' selected="selected"';
        $('max2').value = originValue;
      }
      html += '>最多选' + (i+2) + '项</option>';
      maxSelector.innerHTML += html;
    }
  },

  incrementMaxSelector: function(){
    var cnt = this.countAnswers(true);
    var maxSelector = $('max_multiple_select').childElements()[0];
    var originValue = maxSelector.value;
    maxSelector.innerHTML = '';
    for(var i=0;i<cnt-1;i++){
      var html = '<option value=' + (i+2);
      if(i+2 == originValue){
        html += ' selected="selected"';
        $('max2').value = originValue;
      }
      html += '>最多选' + (i+2) + '项</option>';
      maxSelector.innerHTML += html;
    }
  },

};
