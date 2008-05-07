class Inventory < ActiveRecord::Base

  belongs_to :billable, :polymorphic => true

  before_validation :set_effective_duration
  validates_presence_of :effective_at, :expires_at, :billable_id
  validate :not_in_existing_period
  

  private 

  def not_in_existing_period
    conflicts = Inventory.find_all_by_billable_id(self.billable_id, 
                  :conditions => ["(effective_at, expires_at) 
                    OVERLAPS (TIMESTAMP ?, TIMESTAMP ?)",
                    self.effective_at,self.expires_at])
    errors.add(:effective_at, "conflicts with an exisiting period") if conflicts.any? 
  end
 

  def set_effective_duration
    self.effective_at ||= Time.now
    self.expires_at ||= 10.years.from_now
  end

end
