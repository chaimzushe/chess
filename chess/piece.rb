class Piece
  attr_reader :value
  def initialize(value=0)
    @value = value
  end

  def to_s
    self.value.to_s
  end
end
