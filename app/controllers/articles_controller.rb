class ArticlesController < ApplicationController
  def index
    q = "%#{params[:q]}%"
    @articles = Article.where('title like ? or body like ?', q, q)
  end

  def show
    @article = Article.find(params[:id])
  end
end
