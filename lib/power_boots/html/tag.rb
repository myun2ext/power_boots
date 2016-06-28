module PowerBoots
  module Html
    class Tag
      attr_reader :name, :content

      def initialize(name, content = "", close: true)
        @name = name
        @content = content
        @close = close
      end

      def to_s
        s = "<#{name}>" + @content
        s += "</#{name}>" if @close
        s
      end
    end
  end
end
