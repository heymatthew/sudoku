require 'rails_helper'

require_relative "shared_examples"

RSpec.describe Problem, type: :model do
  let(:eighty_values) {
    "1,2,3,4,5,6,7,8,9," +   # 00's
    "0,1,2,3,4,5,6,7,8,9," + # 10's
    "0,1,2,3,4,5,6,7,8,9," + # 20's
    "0,1,2,3,4,5,6,7,8,9," + # 30's
    "0,1,2,3,4,5,6,7,8,9," + # 40's
    "0,1,2,3,4,5,6,7,8,9," + # 50's
    "0,1,2,3,4,5,6,7,8,9," + # 60's
    "0,1,2,3,4,5,6,7,8,9," + # 70's
    "0"                      # ...80
  }

  let(:eighty_one_values) { eighty_values + ",1" }
  let(:eighty_two_values) { eighty_one_values + ",2" }
  let(:values)            { eighty_one_values }
  let(:problem)           { Problem.new(values: values) }

  describe "#values" do
    subject { problem }

    context "with 81 chars" do
      include_examples "model is #valid?"
    end

    context "with 80 chars" do
      let(:values) { eighty_values }
      include_examples "model is not #valid?", :values
    end

    context "with 82 chars" do
      let(:values) { eighty_two_values }
      include_examples "model is not #valid?", :values
    end

    context "with double digit values" do
      let(:values) { eighty_values + ",00" }
      include_examples "model is not #valid?", :values
    end

    context "with letters" do
      let(:values) { eighty_values + ",a" }
      include_examples "model is not #valid?", :values
    end

    context "with directly assigned arrays" do
      let(:values) { %w(1 2 3) }
      include_examples "model is not #valid?", :values
    end
  end

  describe "#grid composition" do
    let(:grid) {
      Grid.new(%w(
          1 2 3 4 5 6 7 8 9
        0 1 2 3 4 5 6 7 8 9
        0 1 2 3 4 5 6 7 8 9
        0 1 2 3 4 5 6 7 8 9
        0 1 2 3 4 5 6 7 8 9
        0 1 2 3 4 5 6 7 8 9
        0 1 2 3 4 5 6 7 8 9
        0 1 2 3 4 5 6 7 8 9
        0 1
      ))
    }

    subject { problem }

    it "returns instances of Grid" do
      expect(problem.grid).to be_instance_of Grid
    end

    context "after grid has been set" do
      before { problem.grid = grid }

      it "returns instances of Grid" do
        expect(problem.grid).to be_instance_of Grid
      end

      include_examples "model is #valid?"
    end
  end
end
