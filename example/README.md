# Run example application (on Sinatra)

```
$ bundle
$ bundle exec ruby min.rb -o 0.0.0.0
```

```
$ bundle exec ruby bs3.rb -o 0.0.0.0
```

# Most simple html

```ruby
$ vi Gemfile
source 'https://rubygems.org'

gem 'power_boots'
$ bundle
$ vi app.rb
require 'power_boots'

doc = PowerBoots::Html::Document.new do
  head do
    title "Power Boots"
  end
  body do
    h1 "Power Boots"
    tag :p, "Hello world!"
  end
end
puts doc.to_s
$ bundle exec ruby app.rb
<!DOCTYPE html><html><head><title>Power Boots</title></head><body><h1>Power Boots</h1><p>Hello world!</p></body></html>
```
