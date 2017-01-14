module LoginHelper
  def login_redirect?
    unless user_signed_in?
      flash[:danger] = 'Please sign in'
      redirect_to new_user_session_path
    end
  end
end