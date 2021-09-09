class Learn::Awesome
  def initialize
  end

  def execute
  end
  
  # Enumerable #sum -- rails 7
  def enumerable_rails7
    # we should use suitable argument as below after rails 7
    %w[foo bar].sum('')

    # "foobar"
  end

  # Array #sum -- rails 7
  def array_rails7
    # we should use suitable argument as below after rails 7
    [[1, 2], [3, 4, 5]].sum([])

    # [1, 2, 3, 4, 5]
  end


  private
end