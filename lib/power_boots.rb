require "power_boots/version"
require "power_boots/html/tag"
require "power_boots/html/document"
require "power_boots/css/selector"
require "power_boots/models/base"
require "power_boots/models/authentication"

module PowerBoots
  def self.layout_type
    :bs3
  end
end
