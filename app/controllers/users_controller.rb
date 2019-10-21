class UsersController < ApplicationController
  before_action :valid_user, only: [:edit, :show, :update, :destroy]
  
  def new

  end

  def create
  	user = User.create(user_params)
    if user.valid?
      session[:user_id] = user.id
      redirect_to ('/sessions/new') #login
    else
      flash[:errors] = user.errors.full_messages
      redirect_to ('/users/new') #current page
  end
  end

  def show
  	@user = User.find(params[:id])
  	@current_user = @user
    @all_songs = Song.all
  end

  def edit
  	@user = User.find(params[:id])
  	return render 'edit'
  end

  def update
  	@user = User.find(current_user.id)
    if @user.update(name: params[:name], email: params[:email])
      redirect_to "/users/#{@user.id}"
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to :back
  	end
  end

  def display
    @user = User.find(params[:id])
  end

  def destroy
  	user = current_user
    user.delete
    session[:user_id] = nil
    return redirect_to '/sessions/new'
  end

  private
  def user_params
  	params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name)
  end
  def valid_user
  	if current_user != User.find(params[:id])
  		flash[:errors] = ["Please log in to proceed!"]
  		redirect_to "/sessions/new"
  	end
  end

end
