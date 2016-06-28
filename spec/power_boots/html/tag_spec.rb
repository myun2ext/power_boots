require 'power_boots/html/tag'

describe PowerBoots::Html::Tag do
  let(:tag) { PowerBoots::Html::Tag.new(:name, 'Content Text.', close: close) }
  let(:tag_text) { tag.to_s }

  context "with close" do
    let(:close) { true }
    it { expect(tag_text).to eq "<name>Content Text.</name>" }
  end

  context "none close" do
    let(:close) { false }
    it { expect(tag_text).to eq "<name>Content Text." }
  end
end
