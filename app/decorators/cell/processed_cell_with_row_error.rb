class ProcessedCellWithRowError < ProcessedCell
  def errors
    cell.errors << "duplicate on row"
  end
end
