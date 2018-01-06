class CategoriesController < ApplicationController

  before_action :set_category, only: [:edit, :show, :update, :destroy]
  before_action :admin_only

  def admin_only
    if current_user.admin?
    else
      redirect_to '/'
    end
  end

  def index
    if current_user.admin?
      @categories = Category.all
    end
  end

  def new
    if current_user.admin?
      @category = Category.new
    end
  end

  def edit
  end

  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html {redirect_to categories_path, notice: 'Category created!'}
      else
        format.html {render :new}
      end
    end
  end

  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html {redirect_to category_path(@category), notice: 'category was updated'}
      else
        format.html {render :edit}
      end
    end
  end

  def destroy
    @category.destroy
    respond_to do |format|
      format.html {redirect_to categories_path, notice: 'Category deleted'}
    end
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :user_id)
  end
end
