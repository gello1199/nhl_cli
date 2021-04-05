class API
    def self.get_data
        response = RestClient.get('https://statsapi.web.nhl.com/api/v1/teams/?expand=team.roster')
        team = JSON.parse(response)["teams"]
        team.each do |teams|
                        # binding.pry
            Player.new(teams["name"], teams["roster"]["roster"])
        # binding.pry
        end
            binding.pry
    end
end