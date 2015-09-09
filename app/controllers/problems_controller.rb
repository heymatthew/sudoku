class ProblemsController < ApplicationController
  def index
    @problems = Problem.all
  end

  def show
    @problem = Problem.find(problem_id)
    @problem.grid = Problem::DEFAULT_GRID # FIXME remove this
  end

  private

  def problem_id
    params.require(:id)
  end
end
