require_relative 'person'

class Student < Person
  attr_reader :classroom

  def initialize(_classroom, age, name: 'Unknown', parent_permission: true)
    super(age, name: name, parent_permission: parent_permission)
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def to_json(*_args)
    {
      class_name: self.class.name,
      classroom: @classroom,
      age: @age,
      name: @name,
      id: @id,
      parent_permission: @parent_permission
    }
  end
end
