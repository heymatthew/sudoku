class SolutionChecker
  def initialize(grid)
    @grid = grid
    @errors = []
  end

  def call
    mark_groups_with_duplicates('row',     @grid.rows)
    mark_groups_with_duplicates('column',  @grid.columns)
    mark_groups_with_duplicates('subgrid', @grid.subgrids)
    mark_invalid_cells_in_grid

    errors.none?
  end

  def errors
    grid_errors.flatten
  end

  private

  def mark_groups_with_duplicates(group_name, groupings)
    groupings
      .select { |group_cells| duplicates_in_group(group_cells).any? }
      .each   { |group_cells| mark_cells_as_duplicate(group_name, group_cells) }
  end

  def duplicates_in_group(cells)
    cells
      .map(&:value)
      .map(&:to_s)
      .reject(&:empty?)
      .group_by { |cell_value| cell_value }
      .select   { |cell_value, matching| matching.count > 1 }
      .keys
  end

  def mark_cells_as_duplicate(group_name, cells)
    cells.each do |cell|
      cell.errors.push "duplicate values in #{group_name}"
    end
  end

  def mark_invalid_cells_in_grid
    invalid_cells.each do |cell|
      cell.errors.push "invalid value #{cell.value}"
    end
  end

  def invalid_cells
    @grid.cells.reject(&:valid?)
  end

  def grid_errors
    @grid_errors ||= @grid.cells.map(&:errors).reject(&:empty?)
  end
end
