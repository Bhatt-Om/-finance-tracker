class UserStocksController < ApplicationController
  def create
    stock = Stock.check_db(params[:ticker])
    if stock.blank? 
      stock = Stock.new_lookup(params[:ticker])
      stock.save
    end
      @user_stoc = UserStock.create(user_id: current_user.id, stock: stock)
      flash[:notices] = "Stock #{stock.name} was successfully created"
      redirect_to my_portfolio_path
  end

  def destroy
    stock = Stock.find(params[:stock_id])
    user_stock = UserStock.where(user_id: current_user.id, stock_id: stock.id).first
    user_stock.destroy
    flash[:notice] = "Stock #{stock.ticker} was successfully removed from protfolio"
    redirect_to my_portfolio_path
  end
end
