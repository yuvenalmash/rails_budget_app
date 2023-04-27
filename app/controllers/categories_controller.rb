class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @categories = current_user.user_categories
  end

  def new
    @category = current_user.user_categories.build
  end

  def create
    @category = current_user.user_categories.build(category_params)
    if @category.save
      redirect_to categories_path, notice: "Category created successfully"
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
