module PowerBoots
  module Html
    module FormHelpers
      def input name, attributes = {}
        attributes[:type] = :text unless attributes[:type]
        attributes[:name] = name
        attributes[:class] = "form-control" unless attributes[:class]
        attributes[:id] = name

        name = name.to_s
        div class: "form-group" do |g|
          g.label name.capitalize, for: name
          g.tag :input, attributes
        end
      end
      def password name, attributes = {}
        attr = attributes.dup
        attr[:type] = :password
        input name, attr
      end

      def submit name
        button name.to_s.capitalize, class: "btn btn-primary"
      end
    end
  end
end
