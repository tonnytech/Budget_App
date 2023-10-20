class CategoriesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_choices, only: [:new, :create, :edit, :update]

    def index
        @categories = current_user.categories
    end


    def new
        @category = Category.new          
    end

    def create
        @category = current_user.categories.build(category_params)
      
        if @category.save
          redirect_to @category, notice: 'Category was successfully created.'
        else
          render :new
        end
      end
      
    private

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
