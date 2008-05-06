class Basket

  attr_accessor :apples, :base_price

  def initialize(basket)
    @apples = [*Inventory.find(basket.keys)]
    count_apples(basket)
    @base_price = @apples.sum {|apple| apple.sum_price}
  end

  def count_apples(basket)
    @apples.each do |apple| 
      quantity = basket[apple.id]
      apple[:quantity] = quantity
      apple[:sum_price] = apple.price * quantity
    end
  end
end
