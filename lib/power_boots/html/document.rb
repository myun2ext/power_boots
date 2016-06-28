module PowerBoots
  module Html
    class Document
      def initialize
        @content = ''
      end

      def doctype(version = 5)
        '<!DOCTYPE html>'
      end

      def to_s
        doctype + '<html>' + @content + '</html>'
      end
    end
  end
end
