class User::HomeController < UserBaseController

  layout 'app'

  FirstFetchSize = 5

  FetchSize = 5

  FeedCategory = ['status', 'blog', 'all_album_related', 'video', 'sharing']

  def show
    @feed_deliveries = current_user.feed_deliveries.find(:all, :limit => FirstFetchSize, :order => "created_at DESC")
    @friend_suggestions = current_user.find_or_create_friend_suggestions.sort_by{rand}[0..2]
		@first_fetch_size = FirstFetchSize
  end

  def feeds
    if params[:type].blank?
      @feed_deliveries = current_user.feed_deliveries.find(:all, :limit => FirstFetchSize,  :order => "created_at DESC")
    else
      @feed_deliveries = eval("current_user.#{FeedCategory[params[:type].to_i]}_feed_deliveries.find(:all, :limit => FirstFetchSize,  :order => 'created_at DESC')")
    end
  end

  def more_feeds
    if params[:type].blank?
      @feed_deliveries = current_user.feed_deliveries.find(:all, :offset => FirstFetchSize + FetchSize*params[:idx].to_i, :limit => FetchSize,  :order => "created_at DESC")
			@fetch_size = FetchSize
    else
      @feed_deliveries = eval("current_user.#{FeedCategory[params[:type].to_i]}_feed_deliveries.find(:all, :offset => FirstFetchSize + FetchSize*params[:idx].to_i, :limit => FirstFetchSize, :order => 'created_at DESC')")
			@fetch_size = FetchSize
    end
  end

end
