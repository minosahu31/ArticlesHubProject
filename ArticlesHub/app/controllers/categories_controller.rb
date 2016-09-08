class CategoriesController < ApplicationController
  
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_category

  def index
    @categories = Category.all
  end

  def show
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "category created successfully"
      redirect_to categories_path
    else
      flash[:danger] = "Something went wrong while creating"
      render "new"
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      flash[:success] = "category updated successfully"
      redirect_to categories_path
    else
      flash[:danger] = "Something went wrong while category updating"
      render "edit"
    end
  end

  def destroy
    if @category.destroy
      flash[:success] = "category deleted successfully"
      redirect_to categories_path
    else
      flash[:danger] = "Something went wrong while deleting"
    end 
  end

end
