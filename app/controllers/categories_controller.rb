class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_choices, only: %i[new create edit update]
  before_action :set_group, except: %i[index new create]

  def index
    @categories = current_user.categories
  end

  def show
    @category_entities = @setcategory.sorted_entities
    @total_amount = @setcategory.total_amount
  end

  def new
    @category = Category.new
  end

  def create
    @category = current_user.categories.build(category_params)

    if @category.save
      redirect_to categories_path, notice: 'Category was successfully created.'
    else
      render :new
    end
  end

  private

  def set_group
    @setcategory = Category.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end

  def set_choices
    @choices = [
      ['🛒', '🛒'],
      ['🛩️', '🛩️'],
      ['🍽️', '🍽️'],
      ['🚗', '🚗'],
      ['🏠', '🏠'],
      ['🛍️', '🛍️'],
      ['🏥', '🏥'],
      ['🎓', '🎓'],
      ['📦', '📦'],
      ['🎮', '🎮']
    ]
  end

  def category_params
    params.require(:category).permit(:name, :icon, :other_parameter)
  end
end
