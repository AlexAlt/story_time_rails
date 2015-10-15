class StoriesController < ApplicationController
  def index
    @stories = Story.all
    @story = Story.new
    render :index
  end

  def show
    @story = Story.find(params[:id])
    @image = @story.images.new
    images = @story.images
    sentences = []
    images.each do |image|
      image.sentences.each do |sentence|
        sentences.push(sentence)
      end
    end

    @sentences = sentences.sort_by { |obj| obj.created_at }
    render :show
  end

  def create
    @story = Story.new(story_params)
    if @story.save
      redirect_to stories_path
    else
      redirect_to stories_path
      flash[:alert] = "Failed."
    end
  end


  private
  def story_params
    params.require(:story).permit(:title)
  end
end
