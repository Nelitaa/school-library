require_relative 'book'

class BookManager
  attr_accessor :books

  def initialize
    @books = []
  end

  def add_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    @books << Book.new(title, author)
    puts "\nBook created successfully.\n"
  end

  def list_books
    if @books.empty?
      puts "There are no books!\n "
    else
      @books.each { |book| puts "Title: '#{book.title}', Author: #{book.author}" }
      puts "End of list.\n "
    end
  end

  def list_book_by_index
    if @books.empty?
      puts "There are no books!\n "
    else
      @books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }
    end
  end
end
