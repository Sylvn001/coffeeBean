class SessionController < ApplicationController
  before_action :set_user, only: %i[ auth ]

  def auth
    return if session[:user_auth]
    users = session[:users_list]
    user = user_exists?(users)
    return if !user || user.password != @user.password
    session[:user_auth] = SecureRandom.base64(32)
    session[:user] = user
    redirect_to home_path
  end

  def logout
    session.delete(:user_auth) if session[:user_auth]
    session.delete(:user) if session[:user]
    redirect_to users_path
  end

  private
    def user_exists? users
      users = transform_to_object(users)
      return if users.empty?
      users.each do |user|
        if user.email == @user.email
          return user
        end
      end
    end

    def transform_to_object users_text
      users = []
      users_text.each do |user|
        user_info = user.split(";")
        users.push(User.new(email: user_info[0], name: user_info[1], password: user_info[2]))
      end
      users
    end

    def set_user
      @user = User.new(user_params)
    end

    def user_params
      params.require(:user).permit(:email, :password)
    end
end
