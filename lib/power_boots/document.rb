module PowerBoots
  class Document
    attr_reader :doc

    def initialize(layout, &block)
      @layout = layout
      @block = block
    end

    def title(t)
      @title = t
    end

    def assets(head)
      head.link_css "/bs3/css/bootstrap.min.css"
    end

    def head
      doc.head do |head|
        head.title @title
        assets(head)
      end
    end

    def nav(body)
      body.nav :inverse, "fixed-top" do |nav|
        nav.container do |con|
          con.a @title, class: "navbar-brand", href: '/'
          con.ul class: 'nav navbar-nav' do |ul|
            ul.li class: :active do |li| li.a 'Home', href: '/' end
            ul.li do |li| li.a 'About', href: '/about' end
            ul.li do |li| li.a 'Contact', href: '/contact' end
          end
        end
      end
    end

    def body
      doc.body style: "padding-top: 50px" do |body|
        nav(body)
        body.container do |con|
          con.h1 @title
        end
      end
    end

    def render_html
      @block.call(self)

      PowerBoots::Html::Document.new do |doc|
        @doc = doc
        head
        body
      end.to_s
    end
  end
end
