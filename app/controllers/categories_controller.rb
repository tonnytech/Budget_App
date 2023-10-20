class CategoriesController < ApplicationController
    before_action :authenticate_user!

    def index
        @current = current_user
      @categories = Category.where(user_id: @current.id).includes(:spendings)
    end

    def new
        @user = current_user
    end
end
