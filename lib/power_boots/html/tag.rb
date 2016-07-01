require 'power_boots/html/head_helpers'

module PowerBoots
  module Html
    class Tag
      include HeadHelpers

      attr_reader :name, :attributes

      def initialize(name, content = "", attributes: nil, close: true, &block)
        @name = name
        @content = block || content
        @close = close
        @attributes = attributes
      end

      def to_s
        s = "<#{name}#{attributes_to_s}>" + content
        s += "</#{name}>" if @close
        s
      end

      def content
        if @content.is_a? Proc
          p = @content
          @content = ''
          p.call(self)
        else
          @content
        end
      end

      def method_missing(name, *args, &block)
        @content += PowerBoots::Html::Tag.new(name, *args, &block).to_s
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
