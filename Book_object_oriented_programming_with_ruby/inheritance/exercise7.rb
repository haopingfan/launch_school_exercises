class Student

  protected
  attr_reader :grade

  public

  def initialize(name,grade)
    @name = name
    @grade = grade
  end

  def better_grade_than?(enemy)
    self.grade > enemy.grade
  end

end

joe = Student.new("Joe",95)
bob = Student.new("Bob",80)


puts "Well done!" if joe.better_grade_than?(bob) #=> Well done
puts joe.grade #=> error: protected method 'grade' called 