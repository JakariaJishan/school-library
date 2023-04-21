require_relative './classes/book'
require_relative './classes/student'
require_relative './classes/teacher'

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

    def options_verify(choice)
        case choice
        when 1
            list_books
        when 2
            list_people
        when 3
            create_person
        when 4
            create_book
        when 5
            create_rental
        when 6
            list_rentals
        when 7
            puts "Thank you. Hope you enjoy my app."
        else
            puts "Invalid choice.Please try with valid choice"
            puts ""
            run
        end
    end

    def run 
        options
        choice = gets.chomp.to_i
        options_verify(choice)
    end

    def list_books 
        if @books.empty?
            puts "No books found!!"
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
            puts "No people found!!"
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
            puts "Invalid inputs.."
            run
        end

        print "Name:"
        name = gets.chomp
        print "Age:"
        age= gets.chomp

        if ans === 1 
            create_student(name,age)
        elsif ans === 2
            create_teacher(name, age)
        end
    end

    def create_student(name,age)
        student = Student.new(age,nil, name)
        puts student.class.inspect
        @people << student
        puts 'Student created successfully'
        run
    end

    def create_teacher(name,age)
        teacher = Teacher.new( age, 'math',  name)
        @people << teacher
        puts 'Teacher created successfully'
        run
    end

end