module Spree
  class User < ActiveRecord::Base
    include UserAddress

    self.table_name = 'spree_people'

    authenticates_with_sorcery!
    acts_as_paranoid

    validates :password, length: { minimum: 6 }, if: -> { new_record? || changes[:crypted_password] }
    validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
    validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

    validates :email, uniqueness: true, allow_nil: true

    alias_attribute :login, :email

    def admin?
      has_spree_role?(:admin)
    end
  end
end
