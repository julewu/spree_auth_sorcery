class Spree::Admin::UserPasswordsController < ApplicationController
  include Spree::Core::ControllerHelpers::Auth
  include Spree::Core::ControllerHelpers::Common

  layout 'spree/layouts/login'

  def create
    @user = Spree::User.find_by_email(params[:email])

    if @user
      @user.deliver_reset_password_instructions!
      flash.now[:notice] = t('sorcery.reset_password.submit_successfully')
    else
      flash.now[:error] = t('sorcery.reset_password.email_not_registered')
    end
    render :new
  end

  def edit
    @token = params[:reset_password_token]
    @user = Spree::User.load_from_reset_password_token(params[:reset_password_token])

    if @user.blank?
      flash.now[:error] = t('sorcery.reset_password.invalid_token')
      render :new
    end
  end

  def update
    @token = params[:user][:reset_password_token]
    @user = Spree::User.load_from_reset_password_token(params[:user][:reset_password_token])

    if @user.blank?
      flash.now[:error] = t('sorcery.reset_password.invalid_token')
      render :new
      return
    end

    # the next line makes the password confirmation validation work
    @user.password_confirmation = params[:user][:password_confirmation]
    # the next line clears the temporary token and updates the password
    if @user.change_password!(params[:user][:password])
      redirect_to(admin_path, :notice => t('sorcery.reset_password.successfully'))
    else
      # reset_password_token field be cleared in change_password!
      @user.reset_password_token = @token
      render :action => "edit"
    end
  end

end
