module ApplicationHelper
  def number_decimal(value)
    number_with_precision(value, precision: 2, separator: ',', delimiter: '.')
  end
end
