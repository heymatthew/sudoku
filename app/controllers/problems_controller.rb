class ProblemsController < ApplicationController
  before_action :lookup_problem, :except => :index

  def index
    @problems = Problem.all
  end

  def show
  end

  def update
    grid_submission = @problem.grid.compose_with(guess: guess_params)
    solution_checker = SolutionChecker.new(grid: grid_submission)

    if !solution_checker.call
      @errors = solution_checker.errors
    end

    @you_won = @errors.nil? && grid_submission.complete?

    render :show
  end

  private

  def lookup_problem
    @problem ||= Problem.find(problem_id)
  end

  def problem_id
    params.require(:id)
  end

  def guess_params
    params.require(:cell)
  end
end
