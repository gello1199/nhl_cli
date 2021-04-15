class Stats

    attr_accessor :goals, :assists, :points

    @@all = []

    def initialize(goals, assists, points)
        @goals = goals
        @assists = assists 
        @points = points
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

end