module PowerBoots
  module Css
    class Selector
      attr_reader :selectors, :attributes

      def initialize(*selectors, **attributes)
        @selectors = selectors
        @attributes = attributes
      end

      def to_s
        selectors.join(",") + "{" + attributes_to_s + "}"
      end

      private
      def attributes_to_s
        attributes.map { |name,value|
          "#{name}:#{value}"
        }.join(';')
      end
    end
  end
end
