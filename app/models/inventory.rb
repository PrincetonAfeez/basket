class Inventory < ActiveRecord::Base

  belongs_to :billable, :polymorphic => true

end
