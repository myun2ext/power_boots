module PowerBoots
  module Html
    class Document
      def initialize(content = '', &block)
        @content = block || content
      end

      def doctype(version = 5)
        '<!DOCTYPE html>'
      end

      def to_s
        doctype + '<html>' + content + '</html>'
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
    end
  end
end
