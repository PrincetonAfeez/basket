class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  before_filter :basket

  protect_from_forgery 

  
  # Shopping basket 
  
  def basket
    session[:basket] ||= {}
    @basket = Basket.new(session[:basket])
  end

end
