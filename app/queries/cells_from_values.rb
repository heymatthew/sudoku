class CellsFromValues
  def initialize(values)
    @values = values
  end

  def call
    @values.map do |param|
      if param.empty?
        Cell.new
      elsif param.match(/\d+/)
        Cell.new(value: param.to_i)
      else
        Cell.new(value: param)
      end
    end
  end
end
