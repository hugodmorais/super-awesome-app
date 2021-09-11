class Learn::ModuleClass::ClassTest
  def self.test
    puts 'Test'
  end
  
  p self.ancestors  # => [Klass, Object, Kernel, BasicObject]
  include Learn::ModuleClass::ModuleTest
  p self.ancestors  # => [Klass, Mod, Object, Kernel, BasicObject]
end