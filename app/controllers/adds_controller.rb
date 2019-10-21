class AddsController < ApplicationController
  def create
  	Add.create(user: current_user, song_id: params[:id])
	redirect_to :back
  end

  def destroy
  end
end
