require_relative 'person'
require_relative 'student'
require_relative 'teacher'

class PersonManager
  def initialize
    @people = []
  end

  def add_person
    puts 'Do you want to create a student(1) or a teacher(2)? [Input the number]:'
    person = gets.chomp.to_i
    case person
    when 1
      add_student
    when 2
      create_teacher
    else
      puts "Invalid Option!\n "
    end
  end

  def add_student
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp
    print 'Classroom: '
    classroom = gets.chomp
    student = Student.new(classroom, age, name: name, parent_permission: parent_permission)
    @people.push(student)
    puts "\nPerson created successfully.\n "
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    teacher = Teacher.new(specialization, age, name: name)
    @people.push(teacher)
    puts "\nPerson created successfully.\n "
  end

  def list_people
    if @people.empty?
      puts "There are no people!\n "
    else
      @people.each { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
    end
    puts "End of list.\n "
  end
end
