class LockGrid
  def initialize(grid)
    @grid = grid
  end

  def call
    Grid.new(cells: locked_cells)
  end

  private

  def locked_cells
    @grid.cells.map { |cell| lock_if_present(cell) }
  end

  def lock_if_present(cell)
    cell.locked = cell.value.present?
    cell
  end
end
