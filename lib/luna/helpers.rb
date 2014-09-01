module Luna
  module Helpers

    def authenticate_luna_user!
      if !luna_user_signed_in?
        redirect_to open_session_path
        return
      end
    end

    def current_luna_user
      if luna_user_signed_in?
        @user ||= User.new({
          email: session['luna_user_email'], token: session['luna_user_token'],
          id: sessions['luna_user_id']
        })
      end
    end

    def luna_user_signed_in?
      !session['luna_user_id'].blank? && !session['luna_user_email'].blank? &&
        !session['luna_user_token'].blank?
    end

  end
end

ActionController::Base.send(:include, Luna::Helpers)

