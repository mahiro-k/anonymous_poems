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
  
  def create_form
  end
  
  def create
    # 新規ポエム作成
    poem = Poem.new(title: params[:title], discription: params[:discription])
    
    # DBに保存できた場合poems/indexへリダイレクト
    # できなかった場合再レンダリングし、エラー表示
    if poem.save
      redirect_to("/poems/index")
    else
      render("poem/create_form")
    end
  end
  
  def contribute_form
    @poem = Poem.find_by(id: params[:id])
  end
  
  def contribute
    poetry = Poetry.new(poem_id: params[:id], content: params[:content])
    
    # authorが入力されている場合
    if params[:author]
      poetry.author = params[:author]
    end
    
    # DBに保存できた場合poems/:idへリダイレクト
    # できなかった場合再レンダリングし、エラー表示
    if poetry.save
      redirect_to("/poems/#{params[:id]}")
    else
      @poem = Poem.find_by(id: params[:id])
      render("poem/contribute_form")
    end
  end
end
