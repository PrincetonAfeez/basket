class Inventory < ActiveRecord::Base

  belongs_to :billable, :polymorphic => true

  after_validation :set_effective_duration


  private

  def set_effective_duration
    self.effective_at ||= Time.now
    self.expires_at ||= 10.years.from_now
  end

end
