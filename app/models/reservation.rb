class Reservation < ApplicationRecord
    validates :checkin, presence: true
    validates :checkout, presence: true
    validates :numberpeople, presence: true,numericality: true
    validate :start_end_check
  
  
    belongs_to :room
    belongs_to :user
  
    def start_end_check
        if self.checkout < self.checkin
         errors.add(:checkout, "は開始日より前の日付は登録できません。") 
        end
      end
  
      def startday
        return if checkin.blank?
        errors.add(:checkin, "は今日以降のものを選択してください") if start < Date.today
      end

  end
   
