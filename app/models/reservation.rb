class Reservation < ApplicationRecord
    validates :checkin, presence: true
    validates :checkout, presence: true
    validates :numberpeople, presence: true,numericality: true
    validate :start_end_check
  
  
    belongs_to :room
    belongs_to :user
  
    def start_end_check
      if (self.checkin != nil && self.checkout != nil)
        errors.add(:checkout, "はチェックインより後に登録してください") unless
        self.checkin < self.checkout
      end
    end
  end
   
