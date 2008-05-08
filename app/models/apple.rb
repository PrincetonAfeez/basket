class Apple

  attr_accessor :apple, :variety, :quantity

  def initialize(id,basket)
    @apple = id.to_i
    @variety = Inventory.find(@apple).billable_type
    if basket[@variety] && basket[@variety].has_key?(@apple)
      @quantity = basket[@variety][@apple] + 1
    else
      @quantity = 1
    end
  end

  def crunch
    {@variety => {@apple => @quantity}}
  end

end
