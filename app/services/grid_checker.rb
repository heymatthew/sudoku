class GridChecker
  attr_reader :errors

  def initialize(grid)
    @grid = grid
    @errors = []
  end

  def call
    check_rows_for_errors
    check_columns_for_errors
    check_subgrids_for_errors

    errors.none?
  end

  private

  def check_rows_for_errors
    row_errors = errors_in_group(@grid.rows)
    errors.push(*row_errors)
  end

  def check_columns_for_errors
    column_errors = errors_in_group(@grid.columns)
    errors.push(*column_errors)
  end

  def check_subgrids_for_errors
    subgrid_errors = errors_in_group(@grid.subgrids)
    errors.push(*subgrid_errors)
    # TODO concat?
  end

  def errors_in_group(groups)
    groups.map { |group| SudokuGroup.new(group) } # Wrap in a Sudoku grouping
          .reject(&:valid?)                       # ...keep groups that fail validation
          .map(&:errors)                          # ...pull their errors
          .flatten                                # ...return as a single list
  end
end
