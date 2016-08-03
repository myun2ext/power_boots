module PowerBoots
  module Helpers
    module Bs
      module Alert
        def alert(messages, type: :danger)
          tag :div, class: "alert alert-#{type}", role: 'alert' do
            if messages.is_a? Array
              ul do
                messages.each do |msg|
                  li msg
                end
              end
            else
              text messages
            end
          end
        end
        def failer(messages)   alert(messages) end
        def failed(messages)   alert(messages) end
        def error(messages)    alert(messages) end
        def success(messages)  alert(messages, type: :success) end
        def notice(messages)   alert(messages, type: :success) end
        def info(messages)     alert(messages, type: :info)    end
        def warning(messages)  alert(messages, type: :warning) end
      end
    end
  end
end
