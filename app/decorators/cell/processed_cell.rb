ProcessedCell = Struct.new(:cell) do
  delegate :value, to: :cell

  def errors
    []
  end
end
