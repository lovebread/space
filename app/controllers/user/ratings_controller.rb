class User::RatingsController < UserBaseController

  def create
    rating_params = (params[:rating] || {}).merge(:user_id => current_user.id)
    @rating = Rating.new(rating_params)

    if @rating.save
      @rateable = @rating.rateable
      render :update do |page|
        page.replace_html "#{@rateable.class.name.underscore}_#{@rateable.id}_rating_form", :partial => 'show', :locals => {:rateable => @rateable}
      end
    else
      render :update do |page|
        page << "error('#{@rating.errors.on_base}');"
      end
    end
  end

end
