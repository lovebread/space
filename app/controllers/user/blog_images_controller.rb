class User::BlogImagesController < UserBaseController

  def upload
    @image = BlogImage.new(params[:photo])
    if @image.save
			responds_to_parent do
				render :update do |page|
				  page << "facebox.close();nicUploadButton.statusCb({'done':1,'url':'#{@image.public_filename}', 'width':'#{@image.width}'});"  
				end
			end
		else
			render :update do |page|
				page << "error('保存图片的时候发生错误');"
			end
		end
  end

end
