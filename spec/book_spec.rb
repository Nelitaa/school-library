require_relative '../book'
require 'json'

describe Book do
  before(:each) do
    @book = Book.new('The Catcher in the Rye', 'J.D. Salinger')
  end

  it 'test title and author are correctly set' do
    expect(@book.title).to eq('The Catcher in the Rye')
    expect(@book.author).to eq('J.D. Salinger')
  end

  it 'test rentals is an empty array' do
    expect(@book.rentals).to eq([])
  end

  it 'Test to_json method returns a correctly formatted hash' do
    expected = { JSON.create_id => 'Book', 'title' => 'The Catcher in the Rye', 'author' => 'J.D. Salinger' }

    expect(expected).to eq(JSON.parse(@book.to_json))
  end

  it 'Test json_create method returns a correctly formatted object' do
    book = Book.json_create({ 'title' => 'The Catcher in the Rye', 'author' => 'J.D. Salinger' })

    expect(book).to be_a(Book)
    expect(book.title).to eq('The Catcher in the Rye')
    expect(book.author).to eq('J.D. Salinger')
  end
end
