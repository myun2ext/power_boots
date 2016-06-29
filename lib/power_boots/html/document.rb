module PowerBoots
  module Html
    class Document
      attr_reader :content

      def initialize(content = '')
        @content = content
      end

      def doctype(version = 5)
        '<!DOCTYPE html>'
      end

      def to_s
        doctype + '<html>' + content + '</html>'
      end
    end
  end
end
