require_relative 'app'

class Menu
  def initialize
    @app = App.new(self)
    puts 'Welcome to School library App!'
    list_options
  end

  def list_options
    puts "Please choose an option by entering the number:
      1- List all books.
      2- List all people.
      3- Create a person.
      4- Create a book.
      5- Create a rental.
      6- List all rentals for a given person id.
      7- Exit application."
    option = gets.chomp
    select_option(option)
  end

  def select_option(option)
    list = {
      '1' => :list_all_books,
      '2' => :list_all_people,
      '3' => :create_person,
      '4' => :create_book,
      '5' => :create_rental,
      '6' => :list_all_rentals_person,
      '7' => :exit_app
    }
    name_option = list[option]
    @app.send(name_option)
  end
end

def main
  Menu.new
end

main