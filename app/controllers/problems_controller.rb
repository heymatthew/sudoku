class ProblemsController < ApplicationController
  before_filter :fudge_problem_list

  def index
    @problems = Problem.all
  end

  def show
  end

  private

  # TODO load these in from someplace else
  def fudge_problem_list
    if Problem.all.count < 10
      Problem.create!
    end
  end
end
