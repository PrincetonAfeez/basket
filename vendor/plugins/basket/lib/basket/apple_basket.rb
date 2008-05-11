module AppleBasket
  module Acts

    module JuicyApple

      def self.included(base)
        base.extend ClassMethods
      end

      module ClassMethods

        def acts_as_apple_label
          belongs_to :billable, :polymorphic => true
          before_validation :set_effective_duration
          validates_presence_of :effective_at, :expires_at, :billable_id
          validate :not_in_existing_period
          include AppleBasket::Acts::Basket::InstanceMethods
          extend AppleBasket::Acts::Basket::SingletonMethods
        end

        def acts_as_apple
          has_many :inventories, :as => "billable"
          include AppleBasket::Acts::JuicyApple::InstanceMethods
          extend AppleBasket::Acts::JuicyApple::SingletonMethods
        end
      end

      def not_in_existing_period
        conflicts = Inventory.find(:all, 
          :conditions => ["billable_type = :type AND billable_id = :the_id AND
                          ((effective_at <= :starts AND expires_at > :starts)
                          OR (effective_at >= :starts AND effective_at < :expires))",
                          {:starts => self.effective_at, :expires => self.expires_at,
                           :type => self.billable_type, :the_id => self.billable_id}])
        errors.add(:effective_at, "conflicts with an exisiting period") if conflicts.any? 
      end

      def set_effective_duration
        self.effective_at ||= Time.now
        self.expires_at ||= 10.years.from_now
      end

      module SingletonMethods
      end

      module InstanceMethods
    
        def quote
          inventory.price
        end

        def inventory
          Inventory.find(:first, 
            :conditions => ["billable_type = :type AND billable_id = :id AND
                            ((effective_at <= :starts AND expires_at > :starts)
                            OR (effective_at >= :starts AND effective_at < :expires))",
                            {:starts => Time.now, :expires => Time.now+60,
                             :type => self.class.class_name, :id => self.id}])

        end
      end
    end

    module Basket

      module SingletonMethods
      end

      module InstanceMethods
        def variety
          billable_type
        end
      end

    end
  end
end
