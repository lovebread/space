module FaceboxMacroHelpers

  def facebox_link(text, url, options={})
    options = options.merge({
			:rel => 'facebox',
			:facebox_type => 'normal'})

    link_to text, url, options
  end

	def facebox_tip text, msg
		link_to_function text, "tip('#{msg}');"
	end

	def facebox_notice text, msg
		link_to_function text, "alert('#{msg}');"
	end

  def facebox_confirm(text, url, confirm_options={}, html_options={})
    confirm_msg = confirm_options[:msg] || "你确定吗"
    method = confirm_options[:method] || 'post'
    options = html_options.merge({
			:rel => 'facebox', 
			:facebox_confirm => confirm_msg, 
			:facebox_method => method,
			:authenticity_token => form_authenticity_token,
			:facebox_type => 'confirm'})

    link_to text, url, options
  end

	def facebox_confirm_with_validation(text, url, confirm_options={}, html_options={})
		confirm_msg = confirm_options[:msg] || "你确定吗"
		method = confirm_options[:method] || "post"
		options = html_options.merge({
			:rel => 'facebox', 
			:facebox_confirm => confirm_msg, 
			:facebox_method => method,
			:authenticity_token => form_authenticity_token, 
			:facebox_type => 'confirm_with_validation'})
		
		link_to text, url, options
	end

end
