class SessionsController < ApplicationController
    def new
        if session[:user_id]
            session[:user_id] = nil
            puts session[:user_id]
        end
    end
    def create
        if user = User.find_by(email: params[:email])
            user = user.authenticate(params[:password])
        if user
            session[:user_id] = user.id
                redirect_to "/users/#{user.id}"
        else
            flash[:errors] = ["Invalid Password"]
            redirect_to "/sessions/new"
        end
        else
        flash[:errors] = ["Invalid Email"]
        redirect_to "/sessions/new"
        end
    end
    def destroy
        session[:user_id]= nil
        redirect_to "/sessions/new"
    end
end
