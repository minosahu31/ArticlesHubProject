class ArticlesController < ApplicationController
  
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      flash[:success] = "Article created successfully...."
      redirect_to articles_path
    else
      flash[:danger] = "Something went wrong while saving"
      render "new"
    end

  end

  def edit
  end

  def update
    if @article.update(article_params)
      flash[:success] = "Article updated successfully"
      redirect_to articles_path      
    else
      flash[:danger] = "Something went wrong while updating"
      render "edit"
    end
  end

  def destroy
    if @article.destroy
      flash[:success] = "article successfully deleted"
      redirect_to articles_path
    else
      flash[:danger] = "Something went wrong while deleting"
    end
  end

  private 

  def find_article
    @article = Article.find(params[:id])
  end

  def article_params
      params.require(:article).permit(:title, :description, :category_id, :user_id)
  end

end
