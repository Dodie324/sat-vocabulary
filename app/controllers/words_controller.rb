class WordsController < ApplicationController
  respond_to :json, :html

  def index
    @word = Word.order("RANDOM()").first

    respond_to do |format|
      format.html
      format.json { render json: @word }
    end
  end

  def new
    @word = Word.new
  end

  def create
    @word = Word.new(word_params)
    if @word.save
      flash[:notice] = "Word added successfully!"
      redirect_to root_path
    else
      render :new
    end

  end

  private

  def word_params
    params.require(:word).permit(:word, :speech_type, :definition, :sentence)
  end
end
