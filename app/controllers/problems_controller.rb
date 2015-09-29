class ProblemsController < ApplicationController
  before_action :setup_problem, :except => :index

  def index
    @problems = Problem.all
  end

  def show
    @grid = problem_grid
  end

  def update
    composed_grids = ComposeGrids.new(problem_grid, submitted_grid).call
    @grid = CheckSolution.new(composed_grids).call

    @you_won = @grid.errors.none? && @grid.complete?

    render :show
  end

  private

  def setup_problem
    @problem = Problem.find(problem_id)
  end

  def problem_grid
    LockGrid.new(@problem.grid).call
  end

  def submitted_grid
    Grid.new(cells: submitted_cells)
  end

  def submitted_cells
    CellsFromValues.new(guess_params).call
  end

  def problem_id
    params.require(:id)
  end

  def guess_params
    params.require(:cell)
  end
end
