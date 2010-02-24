/**
 * TODO:
 * 怎么数中文字符
 */
function limit_words_of_textarea(text_area, max, count_div){
  if(text_area.value.length > max){
    text_area.value = text_area.value.substring(0, max);
    return false;
  }
  $(count_div).innerHTML = text_area.value.length + "/" + max;
}
