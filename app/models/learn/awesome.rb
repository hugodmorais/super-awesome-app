class Learn::Awesome
  def initialize
  end

  def execute
  end

  # test self
  def my_self
    puts self
  end

  def do_something
    banana = "variable"
    puts banana
    puts self.banana
  end
  def banana
    "method"
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

  class << self
    # String Methods
    def string2FirstLetters(string)
      string[0, 2] # Example teste return te
    end

    def findIfStringOn(string)
      "This is a string".include?(string) # return true or false
    end

    # "string".split # ["string"]
    # "string".split("") # ["s", "t", "r", "i", "n", "g"]
    # "this is a string".split(" ") # ["this", "is", "a", "string"]
    # "Ruby".starts_with?("R") # true
    # "Ruby is great".starts_with?("Ruby") # true
    # "Ruby".ends_with?("y") # true
    # "Ruby is great".ends_with?("great") # true
  end

  private
end