class CategoriesController < ApplicationController
  before_action :find_category, only: [:show, :edit, :update, :destroy]
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
      flash[:success] = "Successfully created!"
      redirect_to categories_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      flash[:success] = "Successfully saved!"
      redirect_to categories_path
    else
      render :edit
    end
  end

  def destroy
    # only empty category can be deleted
    if @category.is_empty? && @category.destroy
      flash[:success] = "Successfully deleted!"
      redirect_to categories_path
    else
      redirect_to :back
      flash[:warning] = "Only empty category can be deleted."
    end
  end

  private
    def find_category
      @category = Category.find(params[:id])
    end
    def category_params
      params.require(:category).permit(:title)
    end
end