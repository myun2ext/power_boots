require 'active_record'

module PowerBoots
  module Models
    class Base < ActiveRecord::Base
      def self.create_table(&block)
        ActiveRecord::Migration.new.create_table(self.table_name, &block) unless table_exists?
      end

      def self.table_exists?
        ActiveRecord::Base.connection.table_exists? table_name
      end

      def connection
        ActiveRecord::Base.connection
      end
    end
  end
end
