require_relative 'rental'
require_relative 'book_manager'
require_relative 'person_manager'

class RentalManager
  attr_accessor :rentals

  def initialize(book_manager, person_manager)
    @rentals = []
    @book_manager = book_manager
    @person_manager = person_manager
  end

  def add_rental
    puts 'Select a book from the following list by number:'
    @book_manager.list_book_by_index
    book_index = gets.chomp.to_i
    puts 'Select a person from the following list by number (not id):'
    @person_manager.list_person_by_index
    person_index = gets.chomp.to_i
    print 'Date: '
    date = gets.chomp
    rental = Rental.new(date, @book_manager.books[book_index], @person_manager.people[person_index])
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
