class StocksController < ApplicationController
  def search
    if params[:stock].present?
      @stock = Stock.new_lookup(params[:stock])
      if @stock
        render 'users/my_portfolio'
      else
        flash[:alert] = 'Please Enter A Valid Symbol To Search'
        redirect_to my_portfolio_path
      end
    else
      flash[:alert] = 'Please Enter A Symbol To Search'
      redirect_to my_portfolio_path
    end
  end
end
