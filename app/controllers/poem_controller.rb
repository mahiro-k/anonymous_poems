require 'poem.rb'
require 'poetry.rb'

class PoemController < ApplicationController
  def index
      @poems = Poem.all
  end
  
  def show
    @poem = Poem.find_by(id: params[:id])
    @poetries = Poetry.where(poem_id: params[:id])
  end
end
