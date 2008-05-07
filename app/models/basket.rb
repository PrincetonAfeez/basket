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
    [*Inventory.find(basket.keys,
        :conditions => "(now() >= effective_at AND now() <= expires_at)")]
  end

  def count_apples(basket)
    @apples.each do |apple| 
      quantity = basket[apple.id]
      apple[:quantity] = quantity
      apple[:sum_price] = apple.price * quantity
    end
  end

end
