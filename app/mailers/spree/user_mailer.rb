module Spree
  class UserMailer < BaseMailer
    def reset_password_email(user)
      @user = Spree::User.find user.id
      @url  = admin_edit_password_url(reset_password_token: @user.reset_password_token)
      mail(to: user.email, from: from_address, subject: t('sorcery.reset_password.email_subject'))
    end
  end
end
