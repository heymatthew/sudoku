require 'rails_helper'

RSpec.describe ProblemsController, type: :controller do
  let(:sample_values) { ([1]*81) }
  let(:sample_grid) { Grid.new(sample_values) }

  describe "#index" do
    subject { assigns(:problems) }

    context "when there are no problems to solve" do
      before { get :index }

      it "shows empty list if there are no problems available" do
        expect(subject).to eq []
      end
    end

    context "when problems are created" do
      before do
        Problem.create!(grid: sample_grid)
        get :index
      end

      it "shows up on the list" do
        expect(subject.size).to be 1
      end
    end
  end

  describe "#show" do
    let(:sample_problem) { Problem.create!(grid: sample_grid) }
    before { get :show, id: sample_problem.id }
    subject { assigns(:problem) }

    it "finds the correct problem in request" do
      expect(subject).to eq sample_problem
    end
  end
end
