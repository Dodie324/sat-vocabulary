class WordsController < ApplicationController
  respond_to :json, :html

  def index
    @word = Word.order("RANDOM()").first

    respond_to do |format|
      format.html
      format.json { render json: @word }
    end
  end

end
