class CLI

    def start
        puts "Welcome to the NHL player reference! What is your name?"
        input = user_input
        greeting(input)
    end

    def user_input
        gets.strip
    end

    def greeting(name)
        puts "Hello, #{name}! Which team would you like to search?"
        menu

    end

end