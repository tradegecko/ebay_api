# frozen_string_literal: true

RSpec.describe EbayApi do
  it "has a version number" do
    expect(EbayApi::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(EbayAPI).to be_kind_of Module
  end
end
