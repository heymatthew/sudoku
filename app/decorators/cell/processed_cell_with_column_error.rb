class ProcessedCellWithColumnError < ProcessedCell
  def errors
    cell.errors << "duplicate on column"
  end
end
