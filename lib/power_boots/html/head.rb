module PowerBoots
  module Html
    class Head
      def initialize
        @content = ''
      end

      def to_s
        '<head>' + @content + '</head>'
      end
    end
  end
end
