require 'rails_helper'

RSpec.describe ProblemsController, type: :controller do
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
        Problem.create!
        get :index
      end

      it "shows up on the list" do
        expect(subject.size).to be 1
      end
    end
  end
end
