require_relative 'book_manager'
require_relative 'person_manager'
require_relative 'rental'
require_relative 'rental_manager'

class App
  def initialize(menu)
    @menu = menu
    @books = BookManager.new
    @people = PersonManager.new
    @rental = RentalManager.new
  end

  def select_option(option)
    options = {
      1 => list_all_books,
      2 => list_all_people,
      3 => create_person,
      4 => create_book,
      5 => create_rental,
      6 => list_all_rentals_person,
      7 => proc { puts "Thank you for using this app!\n " }
    }
    options[option].call
  end

  def create_book
    @books.add_book
    @menu.list_options
  end

  def list_all_books
    @books.list_books
    @menu.list_options
  end

  def create_person
    @people.add_person
    @menu.list_options
  end

  def list_all_people
    @people.list_people
    @menu.list_options
  end

  def create_rental
    @rental.add_rental(@books, @people)
    @menu.list_options
  end

  def list_all_rentals_person
    @rental.list_rentals_for_person_id
    @menu.list_options
  end
end
