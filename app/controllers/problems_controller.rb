class ProblemsController < ApplicationController
  before_filter :lookup_problem, :except => :index

  def index
    @problems = Problem.all
  end

  def show
  end

  def update
    if !solution.valid?
      @errors = solution.errors
    end

    render :show
  end

  private

  def solution
    @solution ||= solution.new(cell_params)
  end

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
