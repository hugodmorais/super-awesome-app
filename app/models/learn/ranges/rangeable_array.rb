class Learn::Ranges::RangeableArray
  include Comparable

  def values
    []
  end

  def error_message
    ''
  end

  def initialize(value)
    raise ArgumentError.new(error_message) unless values.include?(value)

    @value = value
  end

  def to_s
    @value
  end

  def array_index
    values.index(@value)
  end

  def succ
    self.class.new(values[array_index+1])
  end

  def <=> other
    array_index <=> values.index(other.to_s)
  end
end