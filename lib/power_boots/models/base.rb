require 'active_record'

module PowerBoots
  module ActiveRecordExtentions
    def attribute name, type, options
      @attributes ||= {}
      @attributes[name] = options.dup
      @attributes[name][:type] = type
      validates name, options
    end

    def table_exists?
      ActiveRecord::Base.connection.table_exists? table_name
    end

    def create_table
      return if table_exists?

      ActiveRecord::Migration.new.create_table(self.table_name) do |t|
        @attributes.each do |name, opts|
          colopts = {}
          colopts[:null] = false if opts[:presence]
          t.send opts[:type], name, colopts
          if opts[:uniqueness]
            t.index name, unique: true
          end
        end
      end
    end

    #def connection
    #  ActiveRecord::Base.connection
    #end
  end
end

ActiveRecord::Base.extend(PowerBoots::ActiveRecordExtentions)
