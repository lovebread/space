class User::DigsController < UserBaseController

  def create
    @dig = Dig.new((params[:dig] || {}).merge(:poster_id => current_user.id))
    if @dig.save
      render :update do |page|
        page << "tip('成功')"
				page << "$('dig_#{@dig.diggable.class.name.underscore}_#{@dig.diggable.id}').innerHTML = #{@dig.diggable.digs_count}"
        if params[:at].to_i != 1
				  page << "$('digging_#{@dig.diggable.class.name.underscore}_#{@dig.diggable.id}').innerHTML = '<a href=\"#\">已赞</a>'"
        end 
      end
    else
      render :update do |page|
        page << "tip('#{@dig.errors.on_base}');"
      end
    end
  end

end
