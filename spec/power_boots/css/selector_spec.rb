require 'power_boots/css/selector'

describe PowerBoots::Css::Selector do
  let(:style) { PowerBoots::Css::Selector.new(:body, :p, :div, padding: 0, margin: 0) }
  let(:style_text) { style.to_s }

  it { expect(style_text).to eq "body,p,div{padding:0;margin:0}" }
end
