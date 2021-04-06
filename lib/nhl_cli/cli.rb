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
        # while name != "exit"
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
        puts "Please enter the team name to view the current NHL roster."
        selection = user_input.to_i
        roster = Player.find_by_selection(selection)
        roster_details(roster)
    end

    def roster_details(players)
        sorted_roster = players.roster.sort_by {|player| player["jerseyNumber"].to_i}
        sorted_roster.each do |player|
            puts "# #{player["jerseyNumber"]}. #{player["person"]["fullName"]} - Pos: #{player["position"]["name"]}"
            # binding.pry
        end
        puts "Would you like to see another roster? Please enter 'y' for yes and 'exit' to exit."
        menu
    end
end