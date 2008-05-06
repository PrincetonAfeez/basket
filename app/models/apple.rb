class Apple

  attr_accessor :apple, :quantity

  def initialize(id,basket)
    apple = id.to_i
    if basket.has_key?(apple)
      @quantity = basket[apple] + 1
    else
      @quantity = 1
    end
    @apple = apple
  end

  def crunch
    {@apple => @quantity}
  end

end
