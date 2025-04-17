# Create a class 'Student' with attributes name and grade.
# Do NOT make the grade getter public, so joe.grade will raise an error.
# Create a better_grade_than? method, that you can call like so...

class Student
  attr_accessor name

  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  def better_grade_than?(other_student)
    if grade > other_student.grade
      puts "Well done!"
    end
  end

  protected

  attr_reader :grade
end
