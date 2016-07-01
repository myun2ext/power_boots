module PowerBoots
  module Html
    module BsHelpers
      def nav(*options, &block)
        options_s = options.map { |option| " navbar-#{option}" }.join
        @content += "<nav class=\"navbar#{options_s}\">"
        @content += block.call(self) if block
        @content += "</nav>"
      end

      def container(*options, &block)
        options_s = options.map { |option| " #{option}" }.join
        @content += "<div class=\"container#{options_s}\">"
        @content += block.call(self) if block
        @content += "</div>"
      end
    end
  end
end
