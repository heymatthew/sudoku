require 'rails_helper'

RSpec.describe NumberGroup do
  let(:list) { [1,2,3,4,5,6,7,8,9] }
  subject { NumberGroup.new(list) }

  context "list has unique values 1-9" do
    it "is #valid?" do
      puts "omg"
      expect(subject).to be_valid
    end
  end
end
