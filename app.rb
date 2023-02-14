require_relative 'book_manager'
require_relative 'person'
require_relative 'person_manager'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'
require_relative 'rental_manager'

class App
  def initialize(menu)
    @menu = menu
    @books = BookManager.new
    @people = PersonManager.new
  end

  def select_option(option)
    options = {
      1 => @app.method(:list_all_books),
      2 => @app.method(:list_all_people),
      3 => @app.method(:create_person),
      4 => @app.method(:create_book),
      5 => @app.method(:create_rental),
      6 => @app.method(:list_all_rentals_person),
      7 => proc { puts "Thank you for using this app!\n " }
    }
    action = options[option] || raise("Invalid option: #{option}")
    action.call
  end

  def list_all_books
    @books.list_books
    @menu.list_options
  end

  def list_all_people
    @people.list_people
    @menu.list_options
  end

  def create_person
    puts 'Do you want to create a student(1) or a teacher(2)? [Input the number]:'
    person = gets.chomp.to_i
    case person
    when 1
      create_student
    when 2
      create_teacher
    else
      puts "Invalid Option!\n "
    end
    @menu.list_options
  end

  def create_student
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

  def create_book
    @books.add_book
    @menu.list_options
  end

  def create_rental
    puts 'Select a book from the following list by number:'
    @books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }
    book_index = gets.chomp.to_i
    puts 'Select a person from the following list by number (not id):'
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age} "
    end
    person_index = gets.chomp.to_i
    print 'Date: '
    date = gets.chomp
    rental = Rental.new(date, @books[book_index], @people[person_index])
    @rentals.push(rental)
    puts "\nRental created successfully\n"
    @menu.list_options
  end

  def list_all_rentals_person
    print 'ID of person: '
    id = gets.chomp.to_i
    puts 'Rentals:'
    @rentals.each do |rental|
      puts "Date: #{rental.date}, Book: '#{rental.book.title}' by #{rental.book.author}" if rental.person.id == id
    end
    puts "End of list.\n "
    @menu.list_options
  end
end
