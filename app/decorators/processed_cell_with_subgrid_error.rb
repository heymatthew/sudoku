class ProcessedCellWithSubgridError < ProcessedCell
  def errors
    cell.errors << "duplicate on subgrid"
  end
end
