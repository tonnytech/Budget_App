class SpendingsController < ApplicationController

    def index
        @category = Category.find(params[:category_id])
        @spendigs = @category.spendings.order(created_at: :desc)
        @total = @spendigs.map(&:amount).sum
    end

    def new
        @spending = Spending.new
        @category = Category.find(params[:category_id])
    end

    def create
        @spending = Spending.new(spendings_params)
        @category = Category.find(params[:category_id])
    
        if @spending.save
          Link.create(category_id: @category.id, spending_id: @spending.id)
          redirect_to category_spendings_path(category_id: @category.id), notice: 'Transaction was successfully created.'
        else
          redirect_to new_category_spending_path(category_id: @category.id), notice: 'Transaction can\'t be created'
        end
      end
    
      private
    
      def spendings_params
        params.require(:spending).permit(:name, :amount).merge(user_id: current_user.id)
      end
      
end
