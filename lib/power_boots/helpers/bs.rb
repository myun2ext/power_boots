require 'power_boots/helpers/bs/nav'
require 'power_boots/helpers/bs/form'
require 'power_boots/helpers/bs/alert'

module PowerBoots
  module Helpers
    module Bs
      include Nav
      include Form
      include Alert

      def btn(title, path, *options)
        options = ["primary"] if options.empty?
        options_s = options.map { |option| " btn-#{option}" }.join
        tag :a, title, class: "btn" + options_s, href: path
      end

      def container(*options, &block)
        options_s = options.map { |option| " #{option}" }.join
        div class: "container" + options_s, &block
      end
    end
  end
end
