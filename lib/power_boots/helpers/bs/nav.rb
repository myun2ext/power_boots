module PowerBoots
  module Helpers
    module Bs
      module Nav
        class NavLinks < PowerBoots::Html::Tag
          def initialize(attributes={}, &block)
            attributes = attributes.dup
            attributes[:class] = (attributes[:class] || '') + ' nav navbar-nav'
            super :ul, attributes, &block
          end

          def li(name, link = '#', attrbiutes = {})
            if PowerBoots.layout_type == :bs4
              tag :li, class: 'nav-item' do
                a name, class: 'nav-link', href: link
              end
            else
              tag :li, **attributes do
                a name, href: link
              end
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

          options_s += " bg-inverse navbar-dark" if PowerBoots.layout_type == :bs4 && options.include?(:inverse)

          tag :nav, class: "navbar" + options_s do
            @content += NavContainer.new(&block).to_s
          end
        end
      end
    end
  end
end
