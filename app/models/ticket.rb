class Ticket < ActiveRecord::Base

  has_many :inventories, :as => "billable"

  attr_accessor :item

  def inventory(kind=:current)
    inventories.first.id
  end


end
