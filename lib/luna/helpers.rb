module Luna
  module Helpers

    def authenticate_luna_user!
      if !luna_user_signed_in?
        redirect_to open_session_path && return
      end
    end

    def current_luna_user
      if luna_user_signed_in?
        @user ||= User.new({
          email: session['user_email'], token: session['user_token']
        })
      end
    end

    def luna_user_signed_in?
      !session['user_id'].blank? && !session['user_email'].blank? &&
        !session['user_token'].blank?
    end

  end
end

ActionController::Base.send(:include, Luna::Helpers)

