class SentencesController < ApplicationController
  def index
    @image = Image.find(params[:image_id])
    @sentences = @image.sentences
    @sentence = Sentence.new
  end

  def create
    @image = Image.find(params[:image_id])
    @sentence = Sentence.new(sentence_params)
    if @sentence.save
      redirect_to image_sentences_path(@image)
    else
      redirect_to image_sentences_path(@image)
    end
  end

  private
  def sentence_params
    params.require(:sentence).permit(:text, :user_name)
  end
end
