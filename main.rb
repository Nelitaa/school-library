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
      @app.select_option(option)
    else
      puts "Invalid option. Please choose a number between 1 and 7.\n "
    end
    list_options unless option == 7
  end
end

def main
  Menu.new
end

main
