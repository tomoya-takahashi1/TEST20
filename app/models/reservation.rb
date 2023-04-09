class Reservation < ApplicationRecord
    validates :checkin,presence: true

    validates :checkout,presence: true

    validates :numberpeople, presence: true

   

    belongs_to :room
    belongs_to :user

    



      
      def days
       (checkout - checkin).to_i
      end
      
      def cost
        (room.price * days * numberpeople)
      end
      
   

  end
   
  