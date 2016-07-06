module PowerBoots
  class Bs3 < PowerBoots::Html::Document
    def head(&block)
      tag :head do
        instance_eval &block
        link_css "/bs3/css/bootstrap.min.css"
      end
    end
  end
end

def bs3(&block)
  PowerBoots::Bs3.new(&block).to_s
end
