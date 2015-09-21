class ProblemsController < ApplicationController
  before_action :lookup_problem, :except => :index

  def index
    @problems = Problem.all
  end

  def show
  end

  def update
    submission = @problem.grid.compose_with(guess: guess_params)
    solution_checker = SolutionChecker.new(grid: submission)

    if !solution_checker.call
      @errors = solution_checker.errors
    end

    @game_won = @errors.nil? && submission.complete?

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
    params.require(:cell).map do |value|
      value.empty? ? nil : value.to_i
    end
  end
end
