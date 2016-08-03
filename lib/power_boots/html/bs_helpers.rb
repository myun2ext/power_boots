module PowerBoots
  module Html
    module BsHelpers
      def btn(title, path, *options)
        options = ["primary"] if options.empty?
        options_s = options.map { |option| " btn-#{option}" }.join
        tag :a, title, class: "btn" + options_s, href: path
      end

      def container(*options, &block)
        options_s = options.map { |option| " #{option}" }.join
        div class: "container" + options_s, &block
      end
    end
  end
end
