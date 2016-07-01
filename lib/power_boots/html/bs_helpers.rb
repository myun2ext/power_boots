module PowerBoots
  module Html
    module BsHelpers
      def nav(*options, &block)
        options_s = options.map { |option| " navbar-#{option}" }.join
        tag :nav, class: "navbar" + options_s, &block
      end

      def container(*options, &block)
        options_s = options.map { |option| " #{option}" }.join
        div class: "container" + options_s, &block
      end
    end
  end
end
