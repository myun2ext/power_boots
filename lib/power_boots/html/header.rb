module PowerBoots
  module Html
    class Header
      def initialize
        @content = ''
      end

      def to_s
        '<header>' + @content + '</header>'
      end
    end
  end
end
