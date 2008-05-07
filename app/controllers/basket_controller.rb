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


  private

  def basket_puts(id)
    apple = Apple.new(id,session[:basket])
    session[:basket].merge!(apple.crunch)
  end

  def basket_takes(id)
    if id == "all"
      session[:basket].clear
    else
      session[:basket][id.to_i] -= 1
      session[:basket].delete_if {|k,v| v == 0} 
    end
  end



end
