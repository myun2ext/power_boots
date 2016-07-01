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

    def main(&block)
      @main = block
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
      body.nav title: @title, active: 'Home', links: {
        'Home' => '/', 'About' => '/about', 'Contact' => '/contact' }
    end

    def body
      doc.body style: "padding-top: 50px" do |body|
        nav(body)
        body.container do |con|
          con.h1 @title
          @main.call(con)
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
