class Basket

  attr_accessor :apples, :base_price

  def initialize(basket)
    @apples = add_apples(basket)
    count_apples(basket)
    @base_price = @apples.sum {|apple| apple.sum_price}
  end


  private

  def add_apples(basket)
    now = Time.now.xmlschema
    inventories = []
    basket.keys.each do |variety,package|
      inventories << Inventory.find(basket[variety].keys,
        :conditions => "(now() >= effective_at AND now() <= expires_at)")
    end
    inventories.flatten
  end

  def count_apples(basket)
    @apples.each do |apple| 
      quantity = basket[apple.variety][apple.id]
      apple[:quantity] = quantity
      apple[:sum_price] = apple.price * quantity
    end
  end

end
