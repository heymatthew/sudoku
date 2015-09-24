class Solution
  attr_reader :grid

  def initialize(problem_grid, submission)
    submitted_grid = Grid.new(submission)
    @grid = SubmittedGrid.new(problem_grid, submitted_grid)
  end

  def rows
    grid.rows.map do |row|
      row.map do |cell|
        decorate(cell)
      end
    end
  end

  private

  def decorate(cell)
    cell = DecoratedCell.new(cell)
    cell = CellWithRowError.new(cell) if row_errors.include?(cell)
    cell = CellWithColumnError.new(cell) if column_errors.include?(cell)
    cell = CellWithSubgridError.new(cell) if subgrid_errors.include?(cell)
    cell
  end

  def row_errors
    @row_errors ||= grid.rows.select(&:duplicates?).cells
  end

  def column_errors
    @column_errors ||= grid.columns.select(&:duplicates?).cells
  end

  def subgrid_errors
    @subgrid_errors ||= grid.subgrids.select(&:duplicates?).cells
  end
end
