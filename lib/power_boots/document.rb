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
      body.nav :inverse, "fixed-top"
    end

    def body
      doc.body do |body|
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
