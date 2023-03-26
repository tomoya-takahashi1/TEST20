class RoomsController < ApplicationController
   
        def index
      
          if params[:search_area] != "" || params[:search_keyword] != ""
            @rooms = Room.where("address LIKE? AND name LIKE?", "%#{params[:search_area]}%","%#{params[:search_keyword]}%")
          else
            @rooms = Room.all
          end
      
        end
      
        def own
          @rooms = Room.where(user_id: current_user.id)
        end
        
        def new
          @user = User.find(current_user.id)
          @room = Room.new
        end
      
        def create
          @user = User.find(current_user.id)
          @room =  Room.new(params.require(:room).permit(:name,:introduction,:price,:user_id,:address,:image))
          if @room.save
            flash[:success] = "施設を登録しました"
            redirect_to "/rooms/own"
          else
            flash[:warning] = "施設の登録に失敗しました"
            render "rooms/new"
          end
        end
      
        def show
          
          
          if user_signed_in?
            @user = User.find(current_user.id)
          end
        end
      
        def edit
          @room = Room.find(params[:id])
          @user = User.find(current_user.id)
        end
      
        def update
          @room = Room.find(params[:id])
          @user = User.find(current_user.id)
          if @room.update(params.require(:room).permit(:name,:introduction,:price,:user_id,:address,:image))
            flash[:success] = "施設を編集しました"
            redirect_to "/rooms/own"
          else
            flash[:warning] = "施設の登録に失敗しました"
            render "rooms/edit"
          end
        end
      
        def destroy
          @room = Room.find(params[:id])
          @room.destroy
          flash[:success] = "施設を削除しました"
          redirect_to "/rooms/own"
        end
      
end
#@reservation = Reservation.new 35行目@room= Room.find(params[:id])