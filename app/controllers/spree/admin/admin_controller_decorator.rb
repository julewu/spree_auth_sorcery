Spree::Admin::BaseController.class_eval do
  rescue_from CanCan::AccessDenied, :with => :unauthorized

  # Redirect as appropriate when an access request fails.  The default action is to redirect to the login screen.
  # Override this method in your controllers if you want to have special behavior in case the user is not authorized
  # to access the requested action.  For example, a popup window might simply close itself.
  def unauthorized
    if try_spree_current_user
      redirect_to spree.admin_unauthorized_path
    else
      store_location
      redirect_to spree.admin_login_path
    end
  end

end
