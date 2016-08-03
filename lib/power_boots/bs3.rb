module PowerBoots
  class Bs3 < PowerBoots::Html::Document
    def head(&block)
      tag :head do
        instance_eval &block

        if PowerBoots.layout_type == :bs4
          link_css "/bs4/css/bootstrap.min.css"
        else
          link_css "/bs3/css/bootstrap.min.css"
          link_css "/bs3.css"
        end
      end
    end
  end
end

require 'power_boots/helpers/bs/alert'
PowerBoots::Html::Tag.include PowerBoots::Helpers::Bs::Alert

def bs3(&block)
  PowerBoots::Bs3.new(&block).to_s
end
