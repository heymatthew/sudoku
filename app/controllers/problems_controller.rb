class ProblemsController < ApplicationController
  before_action :setup_problem_grid, :except => :index
  before_action :setup_submitted_grid, :only => :update

  def index
    @problems = Problem.all
  end

  def show
    @grid = @problem_grid
  end

  def update
    @grid = ComposeGrids.new(@problem_grid, @submitted_grid).call
    # TODO check submission

    @you_won = @errors.nil? && @grid.complete?

    render :show
  end

  private

  def setup_problem_grid
    @problem = Problem.find(problem_id)
    @problem_grid = LockGridCells.new(@problem.grid).call
  end

  def setup_submitted_grid
    cells = guess_params.map do |param|
      if param.empty?
        Cell.new(value: nil)
      else
        Cell.new(value: param)
      end
    end

    @submitted_grid = Grid.new(cells: cells)
  end

  def problem_id
    params.require(:id)
  end

  def guess_params
    params.require(:cell)
  end
end
