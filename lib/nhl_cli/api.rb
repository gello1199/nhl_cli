class API
    def self.get_data
        response = RestClient.get('https://statsapi.web.nhl.com/api/v1/teams/?expand=team.roster')
        team = JSON.parse(response)["teams"]
        team.each do |teams|
                        # binding.pry
            Team.new(teams["name"], teams["roster"]["roster"]) 
        # binding.pry
        end
            # binding.pry
    end

    def self.get_data_stats(id)
        stat_response = RestClient.get("http://statsapi.web.nhl.com/api/v1/people/#{id}/stats?stats=statsSingleSeason&season=20202021")
        stats = JSON.parse(stat_response)
        binding.pry

        # team.each do |teams|
        #     Team.new(teams["name"], teams["roster"]["roster"])
        # binding.pry
        # end
            # binding.pry
    end

   
end