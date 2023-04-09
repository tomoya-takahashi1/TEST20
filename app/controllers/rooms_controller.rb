class RoomsController < ApplicationController
   
        def index
          @rooms = Room.all
          if params[:search_area] != "" || params[:search_keyword] != ""
            @rooms = Room.where("address LIKE? AND name LIKE?", "%#{params[:search_area]}%","%#{params[:search_keyword]}%")
            @rooms = @Rooms.where(area: params[:q][:area_eq]) if params[:q] && params[:q][:area_eq].present?
          else
            @rooms = Room.all
          end
        end
      
        def new
          @room = Room.new
        
        end
      
        def create
          @room =  Room.new(params.require(:room).permit(:name,:introduction,:price,:address,:image))
          @room.user_id = current_user.id
          if @room.save
            flash[:success] = "施設を登録しました"
            redirect_to    room_path(@room)
          else
            flash[:warning] = "施設の登録に失敗しました"
            render "rooms/new"
          end
        end
      


        def own
          @rooms = Room.where(user_id: current_user.id)
        end

        def destroy
          @room = Room.find(params[:id])
          @room.destroy
          flash[:success] = "施設を削除しました"
          redirect_to "/rooms/own"
        end
      
        def show
          @user = current_user
          @room =  Room.find(params[:id])
          @reservation = Reservation.new
        end
      
        def edit
          @room = Room.find(params[:id])
          @room.user_id = current_user.id
        end
      
        def update
          @room = Room.find(params[:id])
          @room.user_id = current_user.id
          if @room.update(params.require(:room).permit(:name,:introduction,:price,:user_id,:address,:image))
            flash[:success] = "施設を編集しました"
            redirect_to "/rooms/own"
          else
            flash[:warning] = "施設の登録に失敗しました"
            render "rooms/edit"
          end
        end


        private
  def rooms_params
    params.require(:room).permit(name,:address,:introduction,:price,:address,:image,:user_id)
  end
      
        
      
end
#@reservation = Reservation.new 35行目@room= Room.find(params[:id])