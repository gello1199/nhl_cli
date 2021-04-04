#player will belong to a specific team
#player will have specific stats

# class Player
#     attr_accessor :name, :team, :jersey_number, :position, :goals, :assists, :points

#     @@all = []

    # def initialize(name, team, stats)
    #     @name = name
    #     @team = team
    #     @jersey_number = jersey_number
    #     @position = position
    #     @goals = goals

    #gets too long. Need to use metaprogramming

    # end
    
    #using metaprogramming
    
    # def initialize(attributes)
    #     attributes.each {|key, value| self.send(("#{key}="), value)}
    #     save
    # end

#     def save
#         @@all << self
#     end

#     def self.all
#         @@all
#     end

#     def self.destroy_all
#         self.all.clear 
#     end

# end