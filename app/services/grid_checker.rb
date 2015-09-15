class GridChecker
  attr_reader :errors

  def initialize(grid)
    @grid = grid
    @errors = []
  end

  def call
    check(@grid.rows)
    check(@grid.columns)
    check(@grid.subgrids)

    errors.none?
  end

  private

  def check(groups)
    errors.concat(errors_in_group(groups))
  end

  def errors_in_group(groups)
    groups.map { |group| SudokuGroup.new(group) } # Wrap in a Sudoku grouping
          .reject(&:valid?)                       # ...keep groups that fail validation
          .map(&:errors)                          # ...pull their errors
          .flatten                                # ...return as a single list
  end
end
