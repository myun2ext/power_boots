require "power_boots/version"
require "power_boots/html/tag"
require "power_boots/html/document"
require "power_boots/css/selector"

module PowerBoots
  def self.new
    PowerBoots::Document.new
  end
end
