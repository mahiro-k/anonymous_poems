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
    @poem = Poem.new
  end
  
  def create
    # 新規ポエム作成
    poem = Poem.new(title: params[:title], discription: params[:discription])
    
    # DBに保存できた場合poems/indexへリダイレクト
    # できなかった場合再レンダリングし、エラー表示
    if poem.save
      flash.now[:notice] = "作成が完了しました。"
      redirect_to("/poems/index")
    else
    flash.now[:notice] = "内容に誤りがあります。"
      @poem = poem
      render("poem/create_form")
    end
  end
  
  def contribute_form
    @poem = Poem.find_by(id: params[:id])
    @content = ''
    @author = ''
  end
  
  def contribute
    # 再レンダリング用に入力情報を保持
    @content = params[:content]
    @author = params[:author]
    
    poetry = Poetry.new(poem_id: params[:id], content: @content)
    
    # authorが入力されている場合
    if @author
      poetry.author = @author
    end
    
    # DBに保存できた場合poems/:idへリダイレクト
    # できなかった場合再レンダリングし、エラー表示
    if poetry.save
      flash.now[:notice] = "寄稿が完了しました。"
      redirect_to("/poems/#{params[:id]}")
    else
      @poem = Poem.find_by(id: params[:id])
      flash.now[:notice] = "内容に誤りがあります。"
      render("poem/contribute_form")
    end
  end
end
