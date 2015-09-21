class Problem < ActiveRecord::Base
  KEEP_TRAILING_SPACES = -1
  SEPARATOR = ','

  validates :values, presence: true, format: {
    with:    /\A(?:\d?,){80}\d?\z/,
    message: "requires 81 single digits separated by commas",
  }

  composed_of :grid, {
    class_name: "Grid",
    mapping:     %w(values values),
    converter:   ->(grid_instance) { grid_instance.values.join(SEPARATOR) },
    constructor: ->(values_string) { Grid.new(values_string.split(SEPARATOR, KEEP_TRAILING_SPACES)) },
  }
end
