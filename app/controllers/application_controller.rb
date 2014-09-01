class ApplicationController
  def current_luna_user
    if !session['user_email'].blank? && !session['user_token'].blank?
      @user ||= User.new({
        email: session['user_email'], token: session['user_token']
      })
    end
  end
end

