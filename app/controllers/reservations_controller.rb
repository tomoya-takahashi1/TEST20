
    class ReservationsController < ApplicationController
      
        def index 
          @reservations = Reservation.where(user_id: current_user.id)
          @reservations = Reservation.where(id: params[:user_id])
          @reservations = Reservation.all
          @reservation = Reservation.all
        end

        def new
          @reservation = Reservation.new
          @reservations = Reservation.all
          @reservations = Room.where(user_id: current_user.id)
          @rooms = Room.all
          render  "reservations/confirm"
        end
        
        def confirm
          @user = current_user
          @room = Room.find(params[:id])
          @reservation = Reservation.new(reservation_params)
          @reservation = Reservation.new(params.require(:reservation).permit(:checkin,:checkout,:user_id,:room_id,:numberpeople))
          if @reservation.checkin < Date.today
            @reservation.errors.add(:checkin, "は今日以降の日付にしてください")
            render "/rooms/show"
          elsif
            @reservation.checkout <=  @reservation.checkin
            @reservation.errors.add(:checkout, "はチェックイン日より後の日付にしてください")
            render "/rooms/show"
          else
          end
        end
      
        def create
          @reservation = Reservation.new(reservation_params)
          if @reservation.save
            redirect_to "/reservations"
          else
            render "/reservations/confirm"
          end
        end
      
        def back
          @reservation = Reservation.new(params.require(:reservation).permit(:checkin,:checkout,:numberpeople))
          @room = Room.find(@reservation.room_id)
          @user = User.find(@reservation.user_id)
          render "/rooms/show"
        end

        def show
        end
      

       private
       def reservation_params
        params.require(:reservation).permit(:checkin,:checkout,:numberpeople,:user_id,:room_id)

       end
      
      end