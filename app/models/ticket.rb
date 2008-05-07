class Ticket < ActiveRecord::Base

  has_many :inventories, :as => "billable"


  def inventory(kind=:current)
    inventories.first.id
  end


end
