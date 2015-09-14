class Solution
  attr_accessor :errors

  def initialize(cells)
    @cells = cells
    @errors = []
  end

  def valid?
    if not_enough_cells?
      errors.push "need #{expected_cell_count} to play sudoku"
    else
      errors.push(*row_errors)
      errors.push(*column_errors)
      errors.push(*subgrid_errors)
    end

    errors.none?
  end

  def complete?
    @cells.select(&:empty?).count == 0
  end

  def not_enough_cells?
    @cells.count != expected_cell_count
  end

  def expected_cell_count
    WIDTH * HEIGHT
  end

  def row_errors
    row_groups.reject(&:valid?).map(&:errors).flatten
  end

  def subgrid_errors
    subgrid_groups.reject(&:valid?).map(&:errors).flatten
  end

  def column_errors
    column_groups.reject(&:valid?).map(&:errors).flatten
  end
end
