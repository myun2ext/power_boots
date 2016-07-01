module PowerBoots
  module Html
    module HeadHelpers
      def link_css(path)
        @content += "<link rel=\"stylesheet\" type=\"text/css\" href=\"#{path}\">"
      end
    end
  end
end
