class ProblemsController < ApplicationController
  def index
    @problems = Problem.all
  end

  def show
    @problem = Problem.find(problem_id)
  end

  private

  def problem_id
    params.require(:id)
  end
end
