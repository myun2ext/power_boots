module PowerBoots
  module Models
    module Authentication
      def self.included(k)
        k.has_secure_password
        k.attribute :password_digest, :string, presence: true
      end
    end
  end
end
