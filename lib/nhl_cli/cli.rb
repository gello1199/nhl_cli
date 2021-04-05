class CLI

    def start
        puts "Welcome to the NHL player reference! What is your name?"
        API.get_data
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
            menu
        end
    end

    def print_teams
        Player.all.sort {|a, b| a.name <=> b.name}.each.with_index(1) do |team, index|
            puts "#{index}. #{team.name}"
        end
        team_selection
    end

    def goodbye
        puts "Thank you. Please come back soon!"
    end

    def invalid
        puts "I don't understand. Please try again. Select 'y' for yes and 'exit' to exit."
    end

    def team_selection
        puts "Please enter the team name to view the current NHL roster."
        selection = user_input
        roster_details(selection)
    end

    def roster_details(roster)
        puts "#{roster}"
        menu
    end


end