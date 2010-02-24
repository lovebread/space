module InPlaceEditorMacroHelpers
 
  DEFAULT_TEXT_FIELD_OPTIONS = {
		:ok_control => false, 
		:cancel_control => false, 
		:submit_on_blur => true, 
		:rows => 2, 
		:cols => 70, 
		:click_to_edit_text => "点击更新", 
		:saving_text => "正在更新..."}


	def in_place_editor(field_id, url, parameter_name, options = {}, ajax_options = {})
    function = "new Ajax.InPlaceEditorWithEmptyText("
    function << "'#{field_id}', "
    function << "'#{url}'"
 
    js_options = {}

		js_options['callback'] = "
			function(form, value) {
				return '#{parameter_name}=' + value + '&authenticity_token=' + encodeURIComponent('#{form_authenticity_token}');
			}
		"

    js_options['onComplete'] = "
      function(transport, element) {
        if (transport && transport.status == 200) {
          new Effect.Highlight(element.id, {startcolor: \"#00ffff\"});
          var value = transport.responseText;
          if(value.length != 0){
            element.innerHTML = value.escapeHTML().replace(/\\n/g, '<br/>');
          }
        }
      }
    "

    js_options['cancelText'] = %('#{options[:cancel_text]}') if options[:cancel_text]
		js_options['cancelControl'] = options[:cancel_control] unless options[:cancel_control].nil?
    js_options['okText'] = %('#{options[:save_text]}') if options[:save_text]
		js_options['okControl'] = options[:ok_control] unless options[:ok_control].nil?
		js_options['submitOnBlur'] = options[:submit_on_blur] if options[:submit_on_blur]
    js_options['loadingText'] = %('#{options[:loading_text]}') if options[:loading_text]
    js_options['savingText'] = %('#{options[:saving_text]}') if options[:saving_text]
    js_options['rows'] = options[:rows] if options[:rows]
    js_options['cols'] = options[:cols] if options[:cols]
    js_options['size'] = options[:size] if options[:size]
    js_options['externalControl'] = "'#{options[:external_control]}'" if options[:external_control]
    js_options['loadTextURL'] = "'#{url_for(options[:load_text_url])}'" if options[:load_text_url]
    js_options['ajaxOptions'] = options_for_javascript ajax_options
    js_options['htmlResponse'] = !options[:script] if options[:script]
    js_options['clickToEditText'] = %('#{options[:click_to_edit_text]}') if options[:click_to_edit_text]
    js_options['textBetweenControls'] = %('#{options[:text_between_controls]}') if options[:text_between_controls]
		js_options['emptyText'] = "'#{options[:empty_text]}'" if options[:empty_text]
		js_options['emptyClassName'] = "'#{options[:empty_class_name]}'" if options[:empty_class_name]

    function << (', ' + options_for_javascript(js_options)) unless js_options.empty?
    
    function << ')'
 
    javascript_tag(function)
  end
  
  def in_place_text_field(tag_type, object, property, editable = false, url = nil, tag_options = {}, edit_options = {}, ajax_options = {})
    object_name = object.class.to_s.underscore
		tag_options[:id] = "#{object_name}_#{property}_#{object.to_param}" if tag_options[:id].blank?
		
		url ||= "/#{object_name.pluralize}/#{object.to_param}"
		url += ".json"

		options_for_edit = DEFAULT_TEXT_FIELD_OPTIONS.merge(edit_options)
		options_for_ajax = ajax_options.merge({:method => "'put'"})
	
		parameter_name = edit_options.delete(:parameter_name) || "#{object_name}[#{property}]"	
 
		tag = content_tag(tag_type, h(object.send(property)).gsub(/\n/, '<br/>'), tag_options)
		
		return tag + in_place_editor(tag_options[:id], url, parameter_name, options_for_edit, options_for_ajax)
  end

end
