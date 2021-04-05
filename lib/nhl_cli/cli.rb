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
        puts "Hello, #{name}! Would you like to see the roster of your favorite NHL team? Please select 'y' for yes or 'exit' to exit."
        menu
    end

    def menu
        selection = user_input
        if selection == "y"
            print_teams
            menu
        elsif selection == "exit"
            goodbye
        else
            invalid
        end
    end

    def print_teams
        team_list = ["team1", "team2", "team3"]
        team_list.each.with_index(1) do |team, index|
            puts "#{index}. #{team}"
        end
    end

    def goodbye
        puts "Thank you. Please come back soon!"
    end

    def invalid
        puts "I don't understand. Please try again. Select 'y' for yes and 'exit' to exit."
    end


end