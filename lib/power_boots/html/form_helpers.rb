module PowerBoots
  module Html
    module FormHelpers
      def form path, attributes = {}, &block
        attributes[:action] = path
        attributes[:method] = :post unless attributes[:method]
        tag :form, **attributes, &block
      end

      def input name, attributes = {}
        attributes[:type] = :text unless attributes[:type]
        attributes[:name] = name
        attributes[:class] = "form-control" unless attributes[:class]
        attributes[:id] = name

        name = name.to_s
        div class: "form-group" do
          label name.capitalize, for: name
          tag :input, attributes
        end
      end
      def text_field name, attributes = {}
        attr = attributes.dup
        attr[:type] = :text
        input name, attr
      end
      def password name = :password, attributes = {}
        attr = attributes.dup
        attr[:type] = :password
        input name, attr
      end

      def submit name = :submit
        button name.to_s.capitalize, class: "btn btn-primary"
      end
    end
  end
end
