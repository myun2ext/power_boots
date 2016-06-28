module PowerBoots
  module Html
    class Tag
      attr_reader :name, :content, :attributes

      def initialize(name, content = "", attributes: nil, close: true)
        @name = name
        @content = content
        @close = close
        @attributes = attributes
      end

      def to_s
        s = "<#{name}#{attributes_to_s}>" + @content
        s += "</#{name}>" if @close
        s
      end

      private
      def attributes_to_s
        return "" unless attributes
        attributes.map { |name, value|
          " #{name}=\"#{value}\""
        }.join
      end
    end
  end
end
