require 'pry'
require_relative './classes/book'
require_relative './classes/student'
require_relative './classes/teacher'
require_relative './classes/rental'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def options
    puts 'Please choose an option by enter a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given id'
    puts '7 - Exit'
  end

  # rubocop:disable Metrics/CyclomaticComplexity
  def options_verify(choice)
    case choice
    when 1 then list_books
    when 2 then list_people
    when 3 then create_person
    when 4 then create_book
    when 5 then create_rental
    when 6 then list_rentals
    when 7
      puts 'Thank you. Hope you enjoy my app.'
      exit
    else
      puts 'Invalid choice. Please try again.'
      run
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity

  def run
    options
    choice = gets.chomp.to_i
    options_verify(choice)
  end

  def list_books
    if @books.empty?
      puts 'No books found!!'
      puts ''
      run
    end

    @books.each do |book|
      puts "Title: #{book.title}, Author: #{book.author}"
    end
    puts ''
    run
  end

  def create_book
    print 'Title:'
    title = gets.chomp
    print 'Author:'
    author = gets.chomp
    book = Book.new(title, author)
    puts book

    @books << book
    puts 'Book create successfully...'
    puts ''
    run
  end

  def list_people
    if @people.empty?
      puts 'No people found!!'
      puts ''
      run
    end

    @people.each do |person|
      puts person.class
      puts "[#{person.class.name}]  Name: #{person.name}, ID: #{person.id} Age: #{person.age}"
    end
    puts ''
    run
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input only the number]:'
    ans = gets.chomp.to_i
    if ans != 1 && ans != 2
      puts 'Invalid inputs..'
      run
    end

    print 'Name:'
    name = gets.chomp
    print 'Age:'
    age = gets.chomp

    if ans == 1
      create_student(name, age)
    elsif ans == 2
      create_teacher(name, age)
    end
  end

  def create_student(name, age)
    student = Student.new(age, nil, name)
    puts student.class.inspect
    @people << student
    puts 'Student created successfully'
    run
  end

  def create_teacher(name, age)
    teacher = Teacher.new(age, 'math', name)
    @people << teacher
    puts 'Teacher created successfully'
    run
  end

  def create_rental
    if @books.empty? || @people.empty?
      puts 'No books or people found. Create new one.'
      run
    end

    puts 'Select a book from the list by number'

    @books.each_with_index do |book, index|
      puts "#{index + 1} Title: #{book.title}, Author: #{book.author}"
    end

    book_id = gets.chomp.to_i

    puts 'Select a person from the list by number [not ID]'

    @people.each_with_index do |person, index|
      puts "#{index + 1} [#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end

    person_id = gets.chomp.to_i
    print 'date: '
    date = gets.chomp

    rental = Rental.new(date, @books[book_id ], @people[person_id - 1])
    binding pry
    @rentals << rental
    puts 'Rental created successfully.'
    run
  end

  def list_rentals
    if @rentals.empty?
      puts 'No rentals available.'
      run
    end

    print 'Id of person: '
    person_id = gets.chomp.to_i

    puts 'Rentals..'

    rentals = @rentals.select do |rental|
      rental.person.id == person_id
    end

    if rentals.empty?
      puts 'No rentals available for this id'
      run
    end

    rentals.each do |rental|
      puts rental
      puts "#{rental.date}, Book: '#{rental.book.title}' by '#{rental.book.author}'"
    end
    run
  end
end
