require_relative '../rental'
require_relative '../person'
require_relative '../book'
require 'json'
require 'time'

describe Rental do
  before(:each) do
    @person = Person.new(1, 18, 'John')
    @book = Book.new('The Catcher in the Rye', 'J. D. Salinger')
    @rental = Rental.new(Time.now.to_date, @book, @person)
  end

  it 'test rental date is set' do
    expect(@rental.date).to eq(Time.now.to_date)
  end

  it 'test rental has book' do
    expect(@rental.book).to eq(@book)
  end

  it 'test rental has person' do
    expect(@rental.person).to eq(@person)
  end

  it 'test json_create' do
    rental = Rental.json_create({ 'date' => Time.now.to_date, 'book' => @book, 'person' => @person })
    expect(rental).to be_an_instance_of(Rental)
    expect(rental.date).to eq(Time.now.to_date)
    expect(rental.book).to eq(@book)
    expect(rental.person).to eq(@person)
  end

  it 'test to_json' do
    json = @rental.to_json
    expect(json).to be_an_instance_of(String)
    expect(json).to eq({ JSON.create_id => 'Rental', 'date' => Time.now.to_date, 'book' => @book,
                         'person' => @person }.to_json)
  end
end
