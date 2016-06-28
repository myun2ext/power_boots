require 'power_boots/html/body'

describe PowerBoots::Html::Body do
  let(:body) { PowerBoots::Html::Body.new }
  let(:body_text) { body.to_s }

  it { expect(body_text).to eq "<body></body>" }
end
