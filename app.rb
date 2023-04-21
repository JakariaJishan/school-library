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
end