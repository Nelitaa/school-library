#!/usr/bin/env ruby
require_relative 'app'

class Menu
  def initialize
    @app = App.new(self)
    puts "Welcome to School library App!\n "
    list_options
  end

  def list_options
    puts "Please choose an option by entering the number:
      1 - List all books.
      2 - List all people.
      3 - Create a person.
      4 - Create a book.
      5 - Create a rental.
      6 - List all rentals for a given person id.
      7 - Exit application."
    option = gets.chomp.to_i
    if (1..7).include?(option)
      select_option(option)
    else
      puts "Invalid option. Please choose a number between 1 and 7.\n "
      list_options
    end
  end

  def select_option(option)
    options = {
      1 => @app.method(:list_all_books),
      2 => @app.method(:list_all_people),
      3 => @app.method(:create_person),
      4 => @app.method(:create_book),
      5 => @app.method(:create_rental),
      6 => @app.method(:list_all_rentals_person),
      7 => @app.method(:exit_app)
    }
    action = options[option] || raise("Invalid option: #{option}")
    action.call
  end
end

def main
  Menu.new
end

main
