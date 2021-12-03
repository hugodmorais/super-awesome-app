class Learn::PatternMatching::Test01 < Learn::PatternMatching::TypeUnion
  def self.test(arg)
    case arg
    when typeunion(String, Integer)
      puts "String or Integer: #{arg}"
    else
      puts "What's this? #{arg.inspect}"
    end
  end

  private

  def typeunion(*args)
    return Learn::PatternMatching::TypeUnion.new(*args)
  end
end
