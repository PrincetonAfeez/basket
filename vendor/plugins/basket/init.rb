require 'apple_basket.rb'

ActiveRecord::Base.send(:include, AppleBasket::Acts::JuicyApple)
