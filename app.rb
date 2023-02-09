require_relative 'book'
require_relative 'person'
require_relative 'student'

class App
  def initialize
    @books = []
    @people = []
  end

  def list_all_books
    @books.each do |book|
      puts "Title: #{book.title}, Author: #{book.author}"
    end
  end

  def list_all_people
    @people.each do |person|
      puts "[#{person.class}] Name: #{person.name}"
    end
  end

  def create_person
    puts "Do you want to create a student(1) or a teacher(2)? [Input the number]:"
    person = gets.chomp
    case person
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'Invalid Option'
    end
  end

  def create_student
    print 'Age:'
    age = gets.chomp
    print 'Name:'
    name = gets.chomp
    print 'Has parent permission? [Y/N]:'
    parent_permission = gets.chomp
    print 'Classroom:'
    classroom = gets.chomp
    student = Student.new(age, classroom, name, parent_permission)
    @people.push(student)
    puts 'Person created successfully'
  end

  def create_teacher
    print 'Age:'
    age = gets.chomp
    print 'Name:'
    name = gets.chomp
    print 'Specialization:'
    specialization = gets.chomp
    teacher = Teacher.new(age, specialization, name)
    @people.push(teacher)
    puts 'Person created successfully'
  end



