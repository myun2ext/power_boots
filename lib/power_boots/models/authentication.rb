module PowerBoots
  module Models
    module Authentication
      def self.included(k)
        k.has_secure_password
        k.extend ClassMethods
      end

      module ClassMethods
        def add_authentication_columns(t = nil)
          if t
            t.string :password_digest, null: false
          else
            ActiveRecord::Migration.new.add_column self.table_name,
              :string, :password_digest, null: false
          end
        end
      end
    end
  end
end
