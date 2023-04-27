class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, only: %i[show edit update destroy]

  def index
    @categories = current_user.categories.distinct
  end

  def show
    @expenses = @category.expenses
  end

  def new
    @category = current_user.categories.build
  end

  def edit
  end

  def create
    @category = current_user.categories.build(category_params)

    respond_to do |format|
      if @category.save
        format.html do
          redirect_to user_categories_path(current_user),
                      notice: "Category was successfully created."
        end
      end
    end
  end

  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html do
          redirect_to categories_path(current_user),
                      notice: "Category was successfully updated."
        end
      end
    end
  end

  def destroy
    @category.destroy
    respond_to do |format|
      format.html do
        redirect_to user_categories_path(current_user),
                    notice: "Category was successfully destroyed."
      end
    end
  end

  private

  def set_category
    @category = current_user.categories.find(params[:id])
  end
end
