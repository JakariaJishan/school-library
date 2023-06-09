require_relative 'nameable'

class Person < Nameable
  # attr_reader :id
  attr_accessor :name, :age, :rentals, :id

  def initialize(age, name = 'Unknown', parent_permission = 1)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @parent_permission = parent_permission == 1
    @age = age
    @rentals = []
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end


  def add_rental(book, date)
    Rental.new(date, book, self)
  end

  private

  def of_age?
    @age >= 18
  end
end
