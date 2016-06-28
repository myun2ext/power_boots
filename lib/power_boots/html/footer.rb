module PowerBoots
  module Html
    class Hooter
      def initialize
        @content = ''
      end

      def to_s
        '<hooter>' + @content + '</hooter>'
      end
    end
  end
end
