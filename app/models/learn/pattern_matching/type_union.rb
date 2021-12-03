class Learn::PatternMatching::TypeUnion
  def initialize(*args)
    @types = args
  end

  def ===(arg)
    @types.detect{|t| t === arg}
  end
end

def typeunion(*args)
  return TypeUnion.new(*args)
end

def test(arg)
  case arg
  when typeunion(String, Integer)
    puts "String or Integer: #{arg}"
  else
    puts "What's this? #{arg.inspect}"
  end
end

test(4)
test("foo")
test(1.0)
test(false)