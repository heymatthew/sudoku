require 'rails_helper'

RSpec.shared_examples "cell is valid" do
  it "is #valid?" do
    expect(subject).to be_valid
  end

  it "presents value as a string" do
    expect(subject.value).to eq input.to_s
  end
end

RSpec.shared_examples "cell is not valid" do
  it "is not #valid?" do
    expect(subject).to_not be_valid
  end

  it "presents value as a string" do
    expect(subject.value).to eq input.to_s
  end
end

RSpec.describe Cell do
  subject { Cell.new(input) }

  context "when input is positive integer" do
    let(:input) { 9 }
    include_examples "cell is valid"
  end

  context "when input is nil" do
    let(:input) { nil }
    include_examples "cell is valid"

    it "shows up as the empty string" do
      expect(subject.value).to eq ""
    end
  end

  context "when input is empty string" do
  end

  context "when input is negative" do
    let(:input) { -1 }
  end

  context "when input is == 0" do
    let(:input) { 0 }
    it "is not #valid?" do
      expect(subject).to_not be_valid
    end
  end

  context "when input is > 9" do
    let(:input) { 10 }
    it "is not #valid?" do
      expect(subject).to_not be_valid
    end
  end

  context "when setting value" do
  end
end
