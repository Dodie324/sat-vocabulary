class WordsController < ApplicationController

  def index
    @word = Word.order("RANDOM()").first
  end

end
