class PasswordResetsController < ApplicationController


  before_action :get_rgluser,   only: [:edit, :update]
  before_action :valid_rgluser, only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update]
  
  
  def new
  end

  def create
    @rgluser = Parent.find_by(email: params[:password_reset][:email]).user.rgluser
    if @rgluser
      @rgluser.create_reset_digest
      @rgluser.send_password_reset_email
      flash[:success] = "Email sent with password reset instructions"
      redirect_to welcome_index_path
    else
      flash[:danger] = "Email address not found"
      render 'new'
    end
  end

  def edit
    @rgluser = Rgluser.find_by_reset_token(params[:id])
    redirect_to welcome_index_path and return if @rgluser.nil?
  end
  
  def update
    if params[:rgluser][:password].empty?
      flash[:danger] = "Password must be valid"
      render 'edit'
    elsif @rgluser.update_attributes(rgluser_params)
      flash[:success] = "Password has been reset."
      redirect_to welcome_index_path and return
    else
      render 'edit'
    end
  end
  
  private
  
  def rgluser_params
    params.require(:rgluser).permit(:password, :password_confirmation)
  end
  
  def get_rgluser
      @rgluser = Parent.find_by(email: params[:email]).user.rgluser
  end

    # Confirms a valid user.
  def valid_rgluser
    unless @rgluser
      redirect_to root_url
    end
  end
  
  def check_expiration
    if @rgluser.password_reset_expired?
      flash[:danger] = "Password reset has expired."
      redirect_to new_password_reset_url
    end
  end
  
end