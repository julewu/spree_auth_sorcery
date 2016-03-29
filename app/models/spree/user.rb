module Spree
  class User < ActiveRecord::Base
    self.table_name = 'spree_people'

    authenticates_with_sorcery!
  end
end
