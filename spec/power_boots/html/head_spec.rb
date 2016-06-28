require 'power_boots/html/head'

describe PowerBoots::Html::Head do
  let(:head) { PowerBoots::Html::Head.new }
  let(:head_text) { head.to_s }

  it { expect(head_text).to eq "<head></head>" }
end
