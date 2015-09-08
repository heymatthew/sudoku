require 'rails_helper'

RSpec.describe ProblemsController, type: :controller do
  describe "#index" do
    subject { assigns(:problems) }
    before { get :index }

    it "lists problems to solve" do
      expect(subject).to eq []
    end
  end
end
