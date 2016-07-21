module PowerBoots
  module Html
    class Tag; end # Dummy

    module BsHelpers
      class NavLinks < PowerBoots::Html::Tag
        def initialize(attributes={}, &block)
          attributes = attributes.dup
          attributes[:class] = (attributes[:class] || '') + ' nav navbar-nav'
          super :ul, attributes, &block
        end

        def li(name, link = '#', attrbiutes = {})
          tag :li, **attributes do
            a name, href: link
          end
        end
      end

      class NavContainer < PowerBoots::Html::Tag
        def initialize(&block)
          super :div, class: :container, &block
        end

        def brand(name, link='/')
          a name, class: "navbar-brand", href: link
        end

        def links(attributes={}, &block)
          @content += NavLinks.new(**attributes, &block).to_s
        end
      end

      def nav(options: [:inverse, "fixed-top"], &block)
        options_s = options.map { |option| " navbar-#{option}" }.join

        tag :nav, class: "navbar" + options_s do
          @content += NavContainer.new(&block).to_s
        end
      end

      def btn(path, title, *options)
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
