module ApplicationHelper



  #Shopping basket

  def apple_label(apple)
    "#{apple.billable.title} Unit price: #{apple.price} Quantity: #{apple.quantity} Sub-total: #{apple.sum_price}"
  end

end
