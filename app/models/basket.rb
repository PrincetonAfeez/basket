class Basket

  attr_accessor :apples, :base_price

  def initialize(basket)
    @apples = add_apples(basket)
    count_apples(basket)
    @base_price = @apples.sum {|apple| apple.sum_price}
  end


  private

  def add_apples(basket)
    t1 = Time.now.to_s(:db)
    t2 = 60.seconds.from_now.to_s(:db)
    [*Inventory.find(basket.keys,
        :conditions => ["(effective_at, expires_at) 
                         OVERLAPS (TIMESTAMP ?, TIMESTAMP ?)",t1,t2])]
  end

  def count_apples(basket)
    @apples.each do |apple| 
      quantity = basket[apple.id]
      apple[:quantity] = quantity
      apple[:sum_price] = apple.price * quantity
    end
  end

end
