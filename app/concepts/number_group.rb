class NumberGroup
  def initialize(list)
    @list = list
  end

  def valid?
    @list.uniq.length == @list.length
  end
end
