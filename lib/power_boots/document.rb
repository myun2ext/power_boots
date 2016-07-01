module PowerBoots
  class Document
    attr_reader :doc

    def initialize(layout, &block)
      @layout = layout
      @block = block
    end

    def app_name(t = nil)
      if t
        @app_name = t
      else
        @app_name || @title || 'Power Boots'
      end
    end

    def title(t = nil)
      if t
        @title = t
      elsif @app_name
        @app_name + ' - ' + @title
      else
        @title || 'Power Boots'
      end
    end

    def main(&block)
      @main = block
    end

    def assets(head)
      head.link_css "/bs3/css/bootstrap.min.css"
    end

    def head
      doc.head do |head|
        head.title title
        assets(head)
      end
    end

    def nav(body)
      body.nav title: app_name, active: 'Home', links: {
        'Home' => '/', 'About' => '/about', 'Contact' => '/contact' }
    end

    def body
      doc.body style: "padding-top: 50px" do |body|
        nav(body)
        body.container do |con|
          con.h1 title
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
