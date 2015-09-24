class ComposedGroup
  delegate :each, to: :cells

  def initialize(problem_cells, submitted_cells)
    @problem_cells, @submitted_cells = problem_cells, submitted_cells
  end

  def cells
    @cells ||= cell_pairs.map do |problem_cell, submitted_cell|
      # TODO set rename to has_value
      if problem_cell.set?
        problem_cell
      else
        submitted_cell
      end
    end
  end

  def has_duplicates?
    duplicates.any?
  end

  def duplicates
    defined_values
      .group_by { |cell_value| cell_value }
      .select   { |cell_value, matching| matching.count > 1 }
      .keys
  end

  private

  def cell_pairs
    problem_cells.zip(submitted_cells)
  end

  def defined_values
    cells.select(&:set?).map(&:value)
  end
end
