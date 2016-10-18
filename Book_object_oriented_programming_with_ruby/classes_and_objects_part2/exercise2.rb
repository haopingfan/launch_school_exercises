class GoodDog

  attr_reader :name, :age

  def initialize(name,age)
    @name = name
    @age = age
  end

  def to_s
    "The good dog's name is #{name} and he is #{age} years old now"
  end

end



lucky = GoodDog.new("Lucky",5)

puts lucky