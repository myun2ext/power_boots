require 'power_boots/html/head_helpers'

module PowerBoots
  module Html
    class Tag
      include HeadHelpers

      attr_reader :name, :attributes

      def initialize(name, content = "", attributes = {}, close = true, &block)
        @name = name
        @content = block || (content.is_a?(Hash)? '' : content)
        @close = close
        @attributes = content.is_a?(Hash)? content : attributes
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
          instance_eval &p
          @content
        else
          @content
        end
      end

      def space
        @content += ' '
      end

      def text(t)
        @content += t
      end

      def tag(name, content = "", attributes = {}, close = true, &block)
        @content += PowerBoots::Html::Tag.new(name, content, attributes, close, &block).to_s
      end
      def method_missing(name, content = "", attributes = {}, close = true, &block)
        @content += PowerBoots::Html::Tag.new(name, content, attributes, close, &block).to_s
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
