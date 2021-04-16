class Stats

    attr_accessor :goals, :assists, :points, :plusMinus, :wins, :losses, :ot, :shutouts, :goalAgainstAverage, :savePercentage

    @@all = []

    def initialize(stats_hash)
        # binding.pry
       stats_hash.each do |key, value|
        self.send("#{key}=", value) if self.respond_to?("#{key}=")
       end
        # binding.pry
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

end