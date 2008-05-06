ActionController::Routing::Routes.draw do |map|

  map.resource :basket, :controller => "basket"
  map.resources :products
  map.resources :tickets

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
