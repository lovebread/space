module AutoCompleteMacrosHelper

  def auto_complete_field(field_id, url, options = {})
    function = "var #{field_id}_auto_completer = new Ajax.Autocompleter("
    function << "'#{field_id}', "
    function << "'#{field_id}_auto_complete', "
    function << "'#{url}'"
    
    js_options = {}

		# not support callback yet... TODO
    js_options[:tokens] = array_or_string_for_javascript(options[:tokens]) if options[:tokens] # token is a string or array
    js_options[:indicator] = "'#{options[:indicator]}'" if options[:indicator]
    js_options[:select] = "'#{options[:select]}'" if options[:select]
    js_options[:paramName] = "'#{options[:param_name]}'" if options[:param_name]
    js_options[:frequency] = "#{options[:frequency]}" if options[:frequency]
    js_options[:method] = "'get'" 
    js_options[:afterUpdateElement] = options[:after_update_element] if options[:after_update_element]
		js_options[:minChars] = options[:min_chars] if options[:min_chars]
		js_options[:parameters] = "'#{options[:with]}'" if options[:with]

    function << (', ' + options_for_javascript(js_options) + ')')
 
    javascript_tag(function)
  end

  def auto_complete_text_field(object, property, url = nil, tag_options = {}, complete_options = {})
		if url.nil?
			url = url_for({:action => "auto_complete_for_#{object}_#{property}"})
		elsif url.is_a? Hash
			url = url_for(url)
		end

		text_field(object, property, tag_options) +
    content_tag("div", "", :id => "#{object}_#{property}_auto_complete", :class => "drop-menu") +
    auto_complete_field("#{object}_#{property}", url, complete_options)
  end

end
