require 'active_record'
require 'active_support'

=begin
class String
  def underscore(str)
    str.split(/::|(?![a-z])(?=[A-Z])/).map{|s| s.downcase}.join('_')
  end
end
=end

module PowerBoots
  module Models
    class Base < ActiveRecord::Base
      #def self.inherited(k)
      def self.table_name
        #k.table_name = k.name.underscore.pluralize
        name.underscore.pluralize
      end
      def table_name
        self.class.table_name
      end

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
