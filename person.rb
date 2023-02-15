require_relative 'nameable'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'
require_relative 'rental'

class Person < Nameable
  attr_accessor :name, :age, :rentals, :id

  def initialize(id, age, name = 'Unknown', parent_permission = 'Y')
    super()
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []

    return unless @id.nil?

    @id = Random.rand(1..1000)
  end

  private

  def of_age?
    @age >= 18
  end

  public

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(rental)
    @rentals.push(rental)
    rental.person = self
  end
end
