class RentalManager
  def initialize
    @rentals = []
  end

  def add_rental(books, people)
    puts 'Select a book from the following list by number:'
    books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }
    book_index = gets.chomp.to_i
    puts 'Select a person from the following list by number (not id):'
    people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age} "
    end
    person_index = gets.chomp.to_i
    print 'Date: '
    date = gets.chomp
    rental = Rental.new(date, books[book_index], people[person_index])
    @rentals.push(rental)
    puts "\nRental created successfully\n"
  end

  def list_rentals_for_person_id
    print 'ID of person: '
    id = gets.chomp.to_i
    puts 'Rentals:'
    @rentals.each do |rental|
      puts "Date: #{rental.date}, Book: '#{rental.book.title}' by #{rental.book.author}" if rental.person.id == id
    end
    puts "End of list.\n "
  end
end
