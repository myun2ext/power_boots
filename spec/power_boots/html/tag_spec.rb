require 'power_boots/html/tag'

describe PowerBoots::Html::Tag do
  let(:tag) { PowerBoots::Html::Tag.new(:name, 'Content Text.', attributes: attributes, close: close) }
  let(:tag_text) { tag.to_s }

  context "no attributes" do
    let(:attributes) { nil }
    context "with close" do
      let(:close) { true }
      it { expect(tag_text).to eq "<name>Content Text.</name>" }
    end

    context "none close" do
      let(:close) { false }
      it { expect(tag_text).to eq "<name>Content Text." }
    end
  end

  context "with attributes" do
    let(:attributes) { {
      foo: :bar,
      hoge: :huga
    } }

    context "with close" do
      let(:close) { true }
      it { expect(tag_text).to eq '<name foo="bar" hoge="huga">Content Text.</name>' }
    end

    context "none close" do
      let(:close) { false }
      it { expect(tag_text).to eq '<name foo="bar" hoge="huga">Content Text.' }
    end
  end
end
