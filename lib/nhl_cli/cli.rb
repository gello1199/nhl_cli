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
        puts "Hello, #{name.upcase}! Would you like to see the roster of your favorite NHL team? Please type 'y' for yes or 'exit' to exit."
        menu
    end

    def menu
        selection = user_input
        if selection.downcase == "y"
            print_teams
        elsif selection.downcase == "exit"
            goodbye
        else
            invalid
        end
    end

    def print_teams
        puts ColorizedString["
      
         _  __   __ __   __         ___   ____    ____ ______   ____   ___        _____   __    ____
        / |/ /  / // /  / /        / _ | / __ |  / __//_  __/  / __/  / _ |      / ___/  / /   /  _/
       /    /  / _  /  / /__      / , _// /_/ / _| |   / /    / _/   / , _/     / /__   / /__  / /  
      /_/|_/  /_//_/  /____/     /_/|_| |____/ /___/  /_/    /___/  /_/|_|      |___/ /_____/ /___/  
                                                                                                                                                             
      
        "].colorize(:green)
        Team.all.sort {|a, b| a.name <=> b.name}.each.with_index(1) do |team, index|
            puts ColorizedString["~~~~~~~~~~~~~~~~~~~~~~~~~|"].colorize(:white)
            puts ColorizedString["#{index}. #{team.name}"].colorize(:light_blue)
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
        if selection.downcase == "exit"
            goodbye
        elsif selection.to_i.between?(1, Team.all.length)
            roster = Team.find_by_selection(selection)
        roster_details(roster)
        else
            invalid
        end
        
    end

    def roster_details(players)
        puts ColorizedString["#{players.name}"].colorize(:green)
        sorted_roster = players.roster.sort_by {|player| player["jerseyNumber"].to_i} #can't sort string number bc string = 0
        sorted_roster.each do |player|
            # binding.pry
            puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|"
            puts ColorizedString["# #{player["jerseyNumber"]}. #{player["person"]["fullName"]} - #{player["position"]["name"]}"].colorize(:light_blue)
            # binding.pry
        end
        puts "To view individual player statistics, please enter the number of the player of your choice:"
        # puts "Would you like to see another roster? Please enter 'y' for yes and 'exit' to exit."
        selection = user_input
        player_stat = sorted_roster.detect do |player|
                   player["jerseyNumber"] == selection
                #    binding.pry
            end 
            player_selection(player_stat)
        menu
    end
    
    def player_selection(player_stat)
        player_id = player_stat["person"]["id"]
        API.get_data_stats(player_id)
        player_details
        
    end

    def player_details
        player_stats = Stats.all.each do |stats|
            # binding.pry
        if stats.wins
            puts "Wins: #{stats.wins}"
            puts "Losses: #{stats.losses}"
            puts "OT: #{stats.ot}"
            puts "Shutouts: #{stats.shutouts}"
            puts "GAA: #{stats.goalAgainstAverage}"
            puts "SV%: #{stats.savePercentage}"
        else
            # binding.pry
            puts "Goals: #{stats.goals}"
            puts "Assists: #{stats.assists}"
            puts "Total Points: #{stats.points}"
            # binding.pry
        end
    end
    Stats.all.clear
    end
end