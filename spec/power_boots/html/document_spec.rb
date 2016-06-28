require 'power_boots/html/document'

describe PowerBoots::Html::Document do
  let(:document) { PowerBoots::Html::Document.new }
  let(:document_text) { document.to_s }

  it { expect(document_text).to eq "<!DOCTYPE html><html></html>" }
end
