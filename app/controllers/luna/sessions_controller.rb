module Luna

  class SessionsController < ApplicationController

    def new
      @user = Luna::User.new
    end

    def create
      user = params[:user]
      @user = Luna::User.new(email: user[:email], 
                             remember_me: user[:remember_me])
      if @user.auth(user[:password])
        luna_user_sign_in(@user)
        redirect_to root_path
      else
        render action: :new
      end
    end

    def destroy
      luna_user_sign_out
      redirect_to root_path
    end

  end

end

