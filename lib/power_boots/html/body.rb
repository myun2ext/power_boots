module PowerBoots
  module Html
    class Body
      def initialize
        @content = ''
      end

      def to_s
        '<body>' + @content + '</body>'
      end
    end
  end
end
