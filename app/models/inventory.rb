class Inventory < ActiveRecord::Base

  belongs_to :billable, :polymorphic => true

  before_validation :set_effective_duration
  validates_presence_of :effective_at, :expires_at, :billable_id
  validate :not_in_existing_period
  

  private 

  def not_in_existing_period
    conflicts = Inventory.find(:all, 
      :conditions => ["billable_type = :type AND
                      ((effective_at <= :starts AND expires_at > :expires)
                      OR (effective_at >= :starts AND effective_at < :expires))",
                      {:starts => self.effective_at, :expires => self.expires_at,
                       :type => self.billable_type}])
    errors.add(:effective_at, "conflicts with an exisiting period") if conflicts.any? 
  end
 

  def set_effective_duration
    self.effective_at ||= Time.now
    self.expires_at ||= 10.years.from_now
  end

end
