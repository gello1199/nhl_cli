class Team
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
            team_num = self.all.sort {|a, b| a.name <=> b.name}
            input = team_num[num.to_i - 1]
    end
    
end