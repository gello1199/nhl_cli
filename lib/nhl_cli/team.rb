class Team
    attr_accessor :name, :roster, :player 

    @@all = []

    def initialize(name, roster)
        @name = name
        @roster = roster
        self.player_id
        # binding.pry
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def self.find_by_selection(num)
            team_num = self.all.sort {|a, b| a.name <=> b.name}
            input = team_num[num.to_i - 1]
    end

    def player_id
        roster.each do |player|
            @player = player["person"]["id"]
            # binding.pry
        end
    end
    
end