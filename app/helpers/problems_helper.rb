module ProblemsHelper
  def cell_tag(cell)
    content_tag :td, class: ('error' if cell.errors.present?), title: (cell.errors.to_sentence if cell.errors.present?) do
      text_field_tag("cell[]", cell.value, disabled: cell.locked) +
      if cell.locked
        hidden_field_tag("cell[]", cell.value)
      end
    end
  end
end
