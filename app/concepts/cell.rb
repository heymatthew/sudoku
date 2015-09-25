class Cell
  include ActiveModel::Model

  VALID_INPUT_RANGE = (1..9)

  attr_accessor :value, :locked

  delegate :to_s, to: :value

  validates :value,
    allow_nil: true,
    numericality: { only_integer: true },
    inclusion: { in: VALID_INPUT_RANGE }

  validates :locked,
    inclusion: { in: [true, false] }
end
