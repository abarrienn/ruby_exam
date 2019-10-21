class SongsController < ApplicationController
  def index
  	if Song.find_by_id(params[:id])
      @song = Song.find(params[:id])
      @users = User.all
    else
      redirect_to :back
    end
  end

  def create
  	@song = Song.create(title: params[:title], artist: params[:artist], user_id: current_user.id)
		if @song.valid?
			redirect_to :back
		else
			flash[:errors] = ["You must tell your song"]
			redirect_to :back
		end
  end

  def show
  		
      return render "create"
   
  end

  def display
  	
  end

  def destroy
  end
end
