class BasketController < ApplicationController



  def create
    if basket_puts(params[:id])
      flash[:notice] = "Item Added" 
      redirect_to :back
    end
  end

  def destroy
    if basket_takes(params[:id])
      flash[:notice] = "Item removed" 
      redirect_to :back
    end
  end

end
