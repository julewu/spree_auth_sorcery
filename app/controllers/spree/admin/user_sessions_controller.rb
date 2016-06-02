class Spree::Admin::UserSessionsController < ApplicationController
  include Spree::Core::ControllerHelpers::Auth
  include Spree::Core::ControllerHelpers::Common

  layout 'spree/layouts/login'

  def new
    @user = Spree::User.new
  end

  def create
    if @user = login(params[:email], params[:password], params[:remember_me])
      flash[:success] = Spree.t(:logged_in_succesfully)
      redirect_back_or_default(after_admin_logged_in_path)
    else
      flash.now[:error] = t('sorcery.failure.invalid_key_or_passowrd')
      render :new
    end
  end

  def destroy
    logout
    redirect_to(admin_login_path, notice: Spree.t(:logged_out))
  end

  def authorization_failure
  end

  private

    def redirect_back_or_default(default)
      redirect_to(session["spree_user_return_to"] || default)
      session["spree_user_return_to"] = nil
    end

    def after_admin_logged_in_path
      admin_orders_path
    end
end
