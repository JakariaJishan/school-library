class Person 

    attr_reader :id
    attr_accessor :name
    attr_accessor :age

    def initialize(name = "Unknown",age, parent_permission = true )
        @id = Random.rand(1..1000)
        @name=name
        @parent_permission = parent_permission
        @age=age
    end

    def can_use_services? 
        if @age >= 18 || @parent_permission
            return true
         else 
             return false
         end
    end

    private

    def of_age? 
        if @age >= 18 
           return true
        else 
            return false
        end
    end

end


class Student < Person
    def initialize(classroom)
        super(name = "Unknown",age, parent_permission = true)
        @classroom = classroom
    end

    def play_hooky
        "¯\(ツ)/¯"
    end
end