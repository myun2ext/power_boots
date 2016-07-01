module PowerBoots
  class Document
    def initialize(layout, &block)
      @layout = layout
      @block = block
    end

    def title(t)
      @title = t
    end

    def render_html_bs3
      PowerBoots::Html::Document.new do |doc|
        doc.head do |head|
          head.link_css "/bs3/css/bootstrap.min.css"
          head.title @title
        end

        doc.body do |body|
          body.h1 @title
        end
      end.to_s
    end

    def render_html
      @block.call(self)
      render_html_bs3
    end
  end
end
