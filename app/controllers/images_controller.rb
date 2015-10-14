class ImagesController < ApplicationController

  def index
    @story = Story.find(params[:story_id])
    @images = @story.images
  end

  def show
    @story = Story.find(params[:story_id])
    @image = @story.images.find(params[:id])
  end

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


  def destroy
    @story = Story.find(params[:story_id])
    @image = @story.images.find(params[:id])
    @image.destroy
    redirect_to story_path(@story)
  end

  private
  def image_params
    params.require(:image).permit(:image)
  end
end
