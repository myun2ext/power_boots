module PowerBoots
  module Html
    module FormHelpers
      def input name, type: :text
        name = name.to_s
        div class: "form-group" do |g|
          g.label name.capitalize, for: name
          g.tag :input, name: name, type: type, class: "form-control", id: name
        end
      end
      def password name
        name = name.to_s
        div class: "form-group" do |g|
          g.label name.capitalize, for: name
          g.tag :input, name: name, type: :password, class: "form-control", id: name
        end
      end

      def submit name
        button name.to_s.capitalize, class: "btn btn-primary"
      end
    end
  end
end
