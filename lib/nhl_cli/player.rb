# player will belong to a specific team
# player will have specific stats


class Player
    attr_accessor :name, :roster  

    @@all = []

    def initialize(name, roster)
        @name = name
        @roster = roster
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def self.find_by_selection(num)
        if num > 0 && num <= self.all.length
            team_num = self.all.sort {|a, b| a.name <=> b.name}
            input = team_num[num-1]
        end
    end
    
end