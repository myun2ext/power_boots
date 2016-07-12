require "power_boots/html/tag"

module PowerBoots
  module Html
    class Document < Tag
      def initialize(content = '', &block)
        super(:html, content, &block)
      end

      def doctype(version = 5)
        '<!DOCTYPE html>'
      end

      def to_s
        doctype + super
      end
    end
  end
end
