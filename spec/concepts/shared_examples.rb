require 'rails_helper'

RSpec.shared_examples "is #valid?" do
  it "is #valid?" do
    expect(subject).to be_valid
  end

  it "has no errors" do
    expect { subject.valid? }.to_not change { subject.errors }.from([])
  end
end

RSpec.shared_examples "is not #valid?" do |expected_error_regex|
  it "is not #valid?" do
    expect(subject).to_not be_valid
  end

  it "has a sensible error" do
    expect { subject.valid? }
      .to change { subject.errors }
      .from([])
      .to include expected_error_regex
  end
end
