# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def avatar_image(user, opts={})
    size = opts.delete(:size) || "medium"
    if user.avatar.blank?
      image_tag "default_#{size}.png", opts
    else
      image_tag user.avatar.public_filename(size), opts
    end
  end

  def avatar(user, img_opts={}, a_opts={})
		size = img_opts.delete(:size) || "medium"
    a_opts.merge!({:popup => true})
    if user.avatar.blank?
      link_to image_tag("default_#{size}.png", img_opts), profile_url(user.profile), a_opts
    else
      link_to image_tag(user.avatar.public_filename(size), img_opts), profile_url(user.profile), a_opts
    end
  end

  def profile_link(user, opts={})
    link_to user.login, profile_url(user.profile), opts
  end

  def validation_image
    "<img src='/application/new_validation_image' onclick='alert(\"begin\");this.src=\"/application/new_validation_image\";alert(\"done\");' />"
  end

  def ftime(time)
    time.strftime("%Y-%m-%d %H:%M") unless time.blank?
  end

  def ftime2(time)
    time.strftime("%Y-%m-%d") unless time.blank?
  end

  def ftime3(time)
    time.strftime("%m-%d") unless time.blank?
  end

  def ftime4(time)
    time.strftime("%H: %M") unless time.blank?
  end

  def gender_select_tag obj
    select_tag "#{obj.class.to_s.underscore}[gender]", options_for_select([['男', 'male'], ['女', 'female']], obj.gender) 
  end
  
  def privilege_select_tag(object, opts={})
    select_tag "#{object}[privilege]", options_for_select([['所有人', 1], ['好友及玩相同游戏的朋友', 2], ['好友', 3], ['自己', 4]], eval("@#{object}.privilege")), opts 
  end

  def privacy_select_tag(obj, field)
    select_tag "#{obj}[#{field}]", options_for_select([['所有人', 1],  ['好友及玩相同游戏的朋友', 2], ['好友', 3]], eval("@#{obj}.#{field}"))
  end

  def friend_privacy_select_tag(obj, field)
    select_tag "#{obj}[#{field}]", options_for_select([['所有人', 1],  ['玩相同游戏的朋友', 2]], eval("@#{obj}.#{field}"))
  end

  def poll_privilege_select_tag(object)
    select_tag "#{object}[privilege]", options_for_select([['所有人', 1], ['好友', 2]], eval("@#{object}.privilege"))
  end

  def get_subject(user)
    if(current_user == user)
      "我"
    else
      if user.gender == 'male'
        "他"
      else
        "她"
      end
    end
  end

  def album_cover_image album, opts={}
    size = opts.delete(:size) || 'medium'
    if album.cover_id.blank?
      image_tag "default_cover_#{size}.png", opts
    else
      image_tag album.cover.public_filename(size), opts
    end
  end

  def album_cover(album, opts={})
		size = opts.delete(:size) || 'medium'
    if album.cover_id.blank?
      link_to image_tag("default_cover_#{size}.png", opts), eval("#{album.class.to_s.underscore}_url(album)")
    else
      link_to image_tag(album.cover.public_filename(size), opts), eval("#{album.class.to_s.underscore}_url(album)")
    end
  end

  def album_link album, opts={}
    link_to (truncate album.title, :length => 20), eval("#{album.class.name.underscore}_url(album)"), opts
  end

  def photo_link(photo, opts={})
		size = opts.delete(:size) || "large"
    link_to (image_tag photo.public_filename(size), opts), eval("#{photo.class.name.underscore}_url(photo)")
  end

  def dig_link diggable
		dig_html="<div class='evaluate'>
							<span id='dig_#{diggable.class.to_s.underscore}_#{diggable.id}'>#{diggable.digs_count}</span>"
		if diggable.digged_by? current_user
		  dig_html+="<div id='digging_#{diggable.class.to_s.underscore}_#{diggable.id}'<a href='#'>已赞</a>"
		else
			dig_html+="<div id='digging_#{diggable.class.to_s.underscore}_#{diggable.id}'"
		  dig_html+= link_to_remote '赞', :url => digs_url("dig[diggable_type]" => diggable.class.base_class.to_s, "dig[diggable_id]" => diggable)
		end
		dig_html+="</div></div>"
		return dig_html
  end

  def blog_content blog, opts={}
    if blog.content.length > opts[:length]
      (truncate blog.content, opts) + (link_to '查看全文>>', blog_url(blog))
    else
      truncate blog.content, opts
    end
  end

  def blog_link blog, opts={}
    link_to (truncate blog.title, :length => 20), blog_url(blog), opts
  end

	def video_link video, opts={}
		link_to (truncate video.title, :length => 20), video_url(video), opts
	end

	def video_thumbnail video, opts={}
		if (video.thumbnail_url.nil?)
			tempimg = "/images/photo/video01.png"
		else
			tempimg = video.thumbnail_url
		end
		image_tag tempimg, :size => "120x90", :onclick => "Iyxzone.Video.play(#{video.id}, '#{video.embed_html}');"
	end

  def game_link game, opts={}
    link_to game.name, game_url(game), opts
  end

  def event_link event, opts={}
    link_to (truncate event.title, :length => 20), event_url(event), opts
  end

	def poll_link poll, opts={}
		link_to (truncate poll.name, :length => 20), poll_url(poll), opts
	end

	def guild_link guild, opts={}
		link_to (truncate guild.name, :length => 20), guild_url(guild), opts
	end

	def forum_link forum
		link_to (truncate forum.name, :length => 20), forum_url(forum)
	end

	def topic_link topic
		link_to (truncate topic.subject, :length => 40), forum_topic_url(topic.forum, topic)
	end

	def mail_link mail
		if mail.recipient == current_user # in recv box
			if mail.read_by_recipient
				link_to mail.title, mail_url(mail, :type => 1), :id => "mail_#{mail.id}_title"
			else
				link_to "<h3>#{mail.title}</h3>", mail_url(mail, :type => 1), :id => "mail_#{mail.id}_title"
			end
		else # in sent box
			link_to mail.title, mail_url(mail, :type => 0), :id => "mail_#{mail.id}_title"
		end
	end

	def mail_select_tag
    select_tag 'select', options_for_select([['---', '^_^'], ['全部选中','all'], ['选读过的', 'read'], ['选没读的', 'unread'], ['取消全选', 'none']], "---"), :onchange => "Iyxzone.Mail.Manager.onDropdownChange()"
  end

	def button_submit text
		"<button type='submit'>#{text}</button>"
	end

	def button_to_function(name, *args, &block) 
    html_options = args.extract_options!.symbolize_keys

    function = block_given? ? update_page(&block) : args[0] || ''
    html_options[:onclick] = "#{"#{html_options[:onclick]}; " if html_options[:onclick]}#{function};"

    content_tag(:button, name, html_options)
	end

	def server_location server
		if server.game.no_areas
			"#{game_link server.game}, #{server.name}"
		else
			"#{game_link server.game}, #{server.area.name}, #{server.name}"
		end
	end

  def advanced_collection_select object, method, collection, value_method, text_method, options={}, html_options={}, extra_attributes={}
    html_code = "<select>";
    collection.each do |c|
      value = eval("c.#{value_method}")
      text = eval("c.#{text_method}")
      html_code += "<option value='#{value}' "
      extra_attributes.each do |k, v|
        val = eval("c.#{v}")
        html_code += "#{k}='#{val}' "
      end
      html_code += ">#{text}</option>"
    end
    html_code += "</select>"
    return html_code
  end

  def gender user
    if user.gender == 'male' 
      "男"
    else
      "女"
    end
  end

  def time_ago_in_chinese from_time
    e = Time.now - from_time
    if e >= 0 and e < 30
      "不到1分钟前"
    elsif e >= 30 and e < 90
      "1分钟前"
    elsif e >= 90 and e < 2670
      min = e / 60
      "#{min.to_i}分钟前"
    elsif e >= 1470 and e < 5370
      "大约一小时前"
    elsif e >= 5370 and e < 86370
      hour = e / 3600
      "#{hour.to_i}小时前"
    elsif e >= 86370 and e < 172770
      "1天前"
    elsif e >= 172770 and e < 2591970
      day = e / (3600 * 24)
      "#{day.to_i}天前"
    else
      "#{1}个月前"
    end    
  end

  def resize_image photo, opts={}
    if photo.width < 500
      image_tag photo.public_filename, opts
    else
      width = 500
      height = photo.height * 500 / photo.width
      image_tag photo.public_filename, opts.merge({:width => width, :height => height})
    end
  end

  def crop_image photo, opts={}
    size = opts.delete(:size) || ''
    width = photo.width
    height = photo.height
    left = (opts[:width] - width)/2
    top  = (opts[:height] - height)/2
    image_tag photo.public_filename(size), opts.merge({:left => "#{left}px", :top => "#{top}px"})
  end

end
