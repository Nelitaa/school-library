require_relative 'person'

class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date

    @book = book
    book.rentals << self

    @person = person
    person.rentals << self
  end

  def to_json(*_args)
    {
      date: @date,
      book: @book.to_json,
      person: @person.to_json
    }
  end
end
