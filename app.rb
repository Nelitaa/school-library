require_relative "book"
require_relative "person"
require_relative "student"
require_relative "teacher"
require_relative "rental"

class App
  def initialize(menu)
    @menu = menu
    @books = []
    @people = []
    @rentals = []
  end

  def list_all_books
    if @books.empty?
      puts "There are no books!\n "
    else
      @books.each { |book| puts "Title: '#{book.title}', Author: #{book.author}" }
    end
    puts "End of list.\n "
    @menu.list_options
  end

  def list_all_people
    if @people.empty?
      puts "There are no people!\n "
    else
      @people.each { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
    end
    puts "End of list.\n "
    @menu.list_options
  end

  def create_person
    puts "Do you want to create a student(1) or a teacher(2)? [Input the number]:"
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
    print "Age: "
    age = gets.chomp.to_i
    print "Name: "
    name = gets.chomp
    print "Has parent permission? [Y/N]: "
    parent_permission = gets.chomp
    print "Classroom: "
    classroom = gets.chomp
    student = Student.new(classroom, age, name: name, parent_permission: parent_permission)
    @people.push(student)
    puts "\nPerson created successfully.\n "
  end

  def create_teacher
    print "Age: "
    age = gets.chomp.to_i
    print "Name: "
    name = gets.chomp
    print "Specialization: "
    specialization = gets.chomp
    teacher = Teacher.new(specialization, age, name: name)
    @people.push(teacher)
    puts "\nPerson created successfully.\n "
  end

  def create_book
    print "Title: "
    title = gets.chomp
    print "Author: "
    author = gets.chomp
    book = Book.new(title, author)
    @books.push(book)
    puts "\nBook created successfully.\n"
    @menu.list_options
  end

  def create_rental
    puts "Select a book from the following list by number:"
    @books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }
    book_index = gets.chomp.to_i
    puts "Select a person from the following list by number (not id):"
    @people.each_with_index { |person, index| puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age} " }
    person_index = gets.chomp.to_i
    print "Date: "
    date = gets.chomp
    rental = Rental.new(date, @books[book_index], @people[person_index])
    @rentals.push(rental)
    puts "\nRental created successfully\n"
    @menu.list_options
  end

  def list_all_rentals_person
    print "ID of person: "
    id = gets.chomp.to_i
    puts "Rentals:"
    @rentals.each { |rental| puts "Date: #{rental.date}, Book: '#{rental.book.title}' by #{rental.book.author}, Person: [#{rental.person.class}] Name: #{rental.person.name}, ID: #{rental.person.id}, Age: #{rental.person.age}" if rental.person.id == id }
    puts "End of list.\n "
    @menu.list_options
  end
end
