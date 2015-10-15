class ImagesController < ApplicationController

  def index
    @story = Story.find(params[:story_id])
    number = rand(0..@story.images.length)
    @image = @story.images.find_by number: number
  end

  def show
    @story = Story.find(params[:story_id])
    @image = @story.images.find(params[:id])
  end

  def create
    @story = Story.find(params[:story_id])

    previous_number = @story.images.last.number
    if previous_number
      number = previous_number + 1
    else
      number = 0
    end

    @image = @story.images.new(image_params)
    @image.number = number
    if @image.save
      @story.save
      redirect_to story_path(@image.story)
      flash[:notice] = "You did it!!!"
    else
      redirect_to story_path(@image.story)
      flash[:alert] = "Please attach a file"
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
    params.require(:image).permit! if params[:image]
  end
end
