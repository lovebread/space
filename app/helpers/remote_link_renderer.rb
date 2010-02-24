class RemoteLinkRenderer < WillPaginate::LinkRenderer

  # now in view template, you must write in the following way:
  # <%= will_paginate @collection, :remote => {:url => {:action => ''}, ... , :update => ''} %>
  # remote option is mandatory
  # url option is mandatory

  def prepare(collection, options, template)
    @remote = options.delete(:remote) || {}
    @url = @remote.delete(:url) || {}
    super
  end

  def page_link_or_span(page, span_class = 'current', text = nil)
    text ||= page.to_s
		if @url.instance_of? Hash
			url_options = @url.merge({:page => page})
		else
			if @url.include? '?'
				url_options = @url + "&page=#{page}"
			else
				url_options = @url + "?page=#{page}"
			end
		end
    if page and page != current_page
      @template.link_to_remote(text, {:url => url_options, :method => :get}.merge(@remote))
    else
      @template.content_tag :span, text, :class => span_class
    end
  end
 
end
