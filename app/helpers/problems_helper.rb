module ProblemsHelper
  def cell(value)
    if value.nil?
      '<input>'
    else
      "<input val=\"#{value}\">"
    end
  end
end
