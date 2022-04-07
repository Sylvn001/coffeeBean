class UsersController < ApplicationController
  before_action :verify_session_users
  before_action :set_user, only: %i[ show edit update destroy ]
  before_action :is_authenticated

  # GET /users or /users.json
  def index
    self.setUser
    render :index
  end

  def register
    @user = User.new if !@user
    render :register
  end

  # GET /users/new
  def setUser
    @user = User.new if !@user
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)
    #Rails.cache.keys
    respond_to do |format|
      if @user
        session[:users_list].push("#{@user.email};#{@user.name};#{@user.password}" )
        format.html { redirect_to users_path, notice: "User was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    def verify_session_users
      unless session[:users_list]
        session[:users_list] = []
      end
    end

    def set_user
      @user = user_params
    end

    def user_params
      params.require(:user).permit(:name, :email, :password)
    end

    def is_authenticated
      redirect_to home_path if session[:user_auth]
    end
end
