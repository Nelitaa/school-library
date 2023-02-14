class PersonManager
  def initialize
    @people = []
  end

  def add_person(person)
    @people << person
  end

  def list_people
    if @people.empty?
      puts "There are no people!\n "
    else
      @people.each { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
    end
    puts "End of list.\n "
  end
end
