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
    
    # def initialize(attributes)
    #     attributes.each {|key, value| self.send(("#{key}="), value)}
    #     save
    # end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def self.find_by_selection(team_name)
        self.all.detect do |team| 
            team.name == team_name
        end
    end
    
end