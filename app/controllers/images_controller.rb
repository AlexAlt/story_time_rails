class ImagesController < ApplicationController
  def create
    @story = Story.find(params[:story_id])
    @image = @story.images.new(image_params)
    if @image.save
      redirect_to story_path(@image.story)
    else
      redirect_to story_path(@story)
      flash[:alert] = "Failed."
    end
  end

  def upload
    uploaded_io = params[:image]
    File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
      file.write(uploaded_io.read)
    end
  end
  
  private
  def image_params
    params.require(:image).permit(:image)
  end
end
