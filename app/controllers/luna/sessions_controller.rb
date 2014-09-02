module Luna

  class SessionsController < ApplicationController

    def new
      @user = Luna::User.new
    end

    def create
      user = params[:user]
      @user = Luna::User.new(email: user[:email])
      if @user.auth(user[:password])
        luna_user_sign_in(@user)
      else
        render action: :new
      end
    end

  end

end

