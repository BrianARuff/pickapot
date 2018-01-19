class RecipesController < ApplicationController

  before_action :set_recipe, only: %i[show edit update destroy]
  before_action :authenticate_user!, only: %i[edit show create update destroy new]


  def index
    @recipes = if params[:term]
                 Recipe.where('name ILIKE ?', "%#{params[:term]}").page
                 (params[:page]).per(4)
               else
                 Recipe.all.page(params[:page]).per(8)
               end
  end

  def show
    @comment = Comment.new
    @reviews = Review.where(recipe_id: @recipe.user_id).order('created_at DESC')

    if @reviews.blank?
      @avg_review = 0.00001
    else
      @avg_review = @reviews.average(:rating).round(2, :default)
    end
  end

  def edit
    @categories = Category.all
  end

  def new
    @recipe = Recipe.new
    @categories = Category.all
  end

  def create
    @recipe = Recipe.new(recipe_params)

    respond_to do |format|
      if @recipe.save
        format.html {redirect_to recipe_path(@recipe), notice: 'Recipe was created.'}
      else
        format.html {render :new}
      end
    end
  end

  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html {redirect_to recipe_path(@recipe), notice: 'Recipe updated!'}
      else
        format.html {render :edit}
      end
    end
  end

  def destroy
    @recipe.destroy

    respond_to do |format|
      format.html {redirect_to '/', notice: 'Recipe was deleted.'}
    end
  end

  def recipe_by_category
    @categories = Category.all
  end

  def items_by_category
    @recipes = Recipe.where(category_id: params[:cat_id]).page(params[:page]).per(2)
    @category = Category.find(params[:cat_id])
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:ingredient_list, :instruction_list, :user_id, :name, :description, :image, :user_name, :category_id, :remote_image_url, :term)
  end
end