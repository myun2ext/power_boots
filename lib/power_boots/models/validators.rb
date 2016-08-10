module PowerBoots
  module Validators
    def validate_email_of(key)
    end

    def only_alnum(key, options)
      format = "\A["
      format += "a-z"
      format += "0-9"
      format += "A-Z" unless options[:capital] == false
      format += "-"   if options[:hyphen]
      format += "_"   if options[:underscore]
      format += "\."  if options[:dot]
      format += options[:additional] if options[:additional]
      format += "]*\Z"
      validates key, format: Regexp.new(format), length: options[:length], allow_blank: true
    end
  end
end
