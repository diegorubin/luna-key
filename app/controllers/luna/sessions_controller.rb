module Luna

  class SessionsController < ApplicationController

    def new
      @user = Luna::User.new
    end

    def create
      @user = Luna::User.new(email: params[:email])
      if @user.auth(params[:password])
        luna_user_sign_in(@user)
      else
        render action: :new
      end
    end

  end

end

