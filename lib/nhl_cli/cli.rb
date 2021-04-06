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
        puts "Hello, #{name}! Would you like to see the roster of your favorite NHL team? Please type 'y' for yes or 'exit' to exit."
        menu
    end

    def menu
        selection = user_input
        if selection == "y"
            print_teams
        elsif selection == "exit"
            goodbye
        else
            invalid
        end
    end

    def print_teams
        Player.all.sort {|a, b| a.name <=> b.name}.each.with_index(1) do |team, index|
            puts "~~~~~~~~~~~~~~~~~~~~~~~~~|"
            puts "#{index}. #{team.name}"
        end
        team_selection
    end

    def goodbye
        puts "Thank you. Please come back soon!"
    end

    def invalid
        puts "I don't understand. Please try again. Type 'y' for yes and 'exit' to exit."
        menu
    end

    def team_selection
        puts "Please enter the number of the team that you want to view."
        selection = user_input
        if selection == "exit"
            goodbye
        elsif selection.to_i.between?(1, Player.all.length)
            roster = Player.find_by_selection(selection)
        roster_details(roster)
        else
            invalid
        end
        
    end

    def roster_details(players)
        sorted_roster = players.roster.sort_by {|player| player["jerseyNumber"].to_i}
        sorted_roster.each do |player|
            puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|"
            puts "# #{player["jerseyNumber"]}. #{player["person"]["fullName"]} - Pos: #{player["position"]["name"]}"
            # binding.pry
        end
        puts "Would you like to see another roster? Please enter 'y' for yes and 'exit' to exit."
        menu
    end
end