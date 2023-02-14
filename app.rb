require_relative 'book_manager'
require_relative 'person_manager'
require_relative 'rental_manager'

class App
  def initialize(menu)
    @menu = menu
    @books = BookManager.new
    @people = PersonManager.new
    @rental = RentalManager.new(@books, @people)
  end

  def select_option(option)
    case option
    when 1 then @books.list_books
    when 2 then @people.list_people
    when 3 then @people.add_person
    when 4 then @books.add_book
    when 5 then @rental.add_rental
    when 6 then @rental.list_rentals_for_person_id
    else puts 'Thank you for using this app!'
    end
  end
end
