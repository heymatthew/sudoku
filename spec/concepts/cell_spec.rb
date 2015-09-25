require 'rails_helper'

RSpec.describe Cell do
  describe "#value" do
    subject { Cell.new(value: value, locked: true) }

    context "is positive integer" do
      let(:value) { 9 }
      it "is #valid?" do
        expect(subject).to be_valid
      end
    end

    context "is nil" do
      let(:value) { nil }
      it "is #valid?" do
        expect(subject).to be_valid
      end
    end

    context "just out of lower bound" do
      let(:value) { 0 }
      it "is not #valid?" do
        expect(subject).to_not be_valid
      end
    end

    context "just out of upper bound" do
      let(:value) { 10 }
      it "is not #valid?" do
        expect(subject).to_not be_valid
      end
    end

    context "is empty string" do
      let(:value) { "" }
      it "is not #valid?" do
        expect(subject).to_not be_valid
      end
    end

    context "is negative" do
      let(:value) { -1 }
      it "is not #valid?" do
        expect(subject).to_not be_valid
      end
    end
  end

  describe "#locked" do
    subject { Cell.new(locked: locked) }

    context "when true" do
      let(:locked) { true }
      it "is #valid?" do
        expect(subject).to be_valid
      end
    end

    context "when false" do
      let(:locked) { true }
      it "is #valid?" do
        expect(subject).to be_valid
      end
    end

    context "when not specified" do
      let(:locked) { nil }
      it "is not #valid?" do
        expect(subject).to_not be_valid
      end
    end
  end
end
