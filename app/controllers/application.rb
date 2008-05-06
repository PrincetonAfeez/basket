# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  before_filter :basket
  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => 'b3d264b155a26dba719323209032beed'

  
  # Shopping basket 
  
  def basket_puts(id)
    apple = Apple.new(id,session[:basket])
    session[:basket].merge!(apple.crunch)
  end

  def basket_takes(id)
    session[:basket][id.to_i] -= 1
    session[:basket].delete_if {|k,v| v == 0} 
  end


  def basket
    session[:basket] ||= {}
    @basket = Basket.new(session[:basket])
  end

end
