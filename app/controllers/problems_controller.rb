class ProblemsController < ApplicationController
  before_action :lookup_problem, :except => :index

  def index
    @problems = Problem.all
  end

  def show
  end

  def update
    solution = Solution.new(cell_params)

    if !solution.valid?
      @errors = solution.errors
    end

    render :show
  end

  private

  def lookup_problem
    @problem ||= Problem.find(problem_id)
  end

  def problem_id
    params.require(:id)
  end

  def cell_params
    params.require(:cell)
  end
end
