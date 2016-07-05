module PowerBoots
  module Html
    module BsHelpers
      def nav(title: 'Example', active: '', options: [:inverse, "fixed-top"], links: [])
        options_s = options.map { |option| " navbar-#{option}" }.join
        tag :nav, class: "navbar" + options_s do |nv|
          nv.container do |con|
            con.a title, class: "navbar-brand", href: '/'
            con.ul class: 'nav navbar-nav' do |ul|
              links.each do |title, href|
                cls = (title == active)? :active : ''
                ul.li class: cls do |li| li.a title, href: href end
              end
              ''
            end
          end
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
