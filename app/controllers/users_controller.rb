class UsersController < ApplicationController
  def new
    @user = User.new
  end

  # Creates a new user, if a user doesn't exist - uses email as an identifier
  def create
    Rails.logger.debug("User params: #{params.inspect}")
    @user = User.find_by(email: user_params[:email])
  
    if @user
      flash[:alert] = "User already exists!"
      render :new
    else
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to user_page_path, notice: "Account created"
      else
        flash[:alert] = "Unable to create account"
        render :new
      end
    end
  end

  # Creates a login session by checking if the user exists
  def create_session
    user = User.find_by(email: params[:user][:email])
    # Account doesn't exist
    if user.nil?
      @error_message = "Account doesn't exist"
      render 'home/index'
    # Logging in happy path
    elsif user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to user_page_path, notice: "Signed in!"
    # Incorrect password
    else
      @error_message = "Invalid email or password."
      render 'home/index' 
    end
  end

  private

  # Required parameters for the given User object
  def user_params
    params.require(:user).permit(:email, :password)
  end
end