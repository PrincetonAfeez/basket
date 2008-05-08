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
    if session[:basket][apple.variety]
      session[:basket][apple.variety].merge!(apple.crunch[apple.variety])
    else
      session[:basket][apple.variety] = apple.crunch[apple.variety]
    end
  end

  def basket_takes(id)
    if id == "all"
      session[:basket].clear
    else
      apple = Inventory.find(id)
      session[:basket][apple.variety][apple.id] -= 1
      session[:basket][apple.variety].delete_if {|k,v| v == 0} 
      session[:basket].delete_if {|k,v| v.empty?} #<^ i think this is a bit of a wtf.
    end
  end
end
