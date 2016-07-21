module PowerBoots
  module Models
    class User < ActiveRecord::Base
      self.table_name = :users
      has_secure_password

      def self.create_table
        ActiveRecord::Migration.new.create_table(:users) do |t|
          t.string :password_digest, null: false
        end
      end
    end
  end
end
