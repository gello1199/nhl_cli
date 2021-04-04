class API
    def self.get_data #player
        response = RestClient.get('https://statsapi.web.nhl.com/api/v1/configurations')
        # binding.pry

    end

    # def self.get_data #team
    #     response = RestClient.get('https://statsapi.web.nhl.com/api/v1/configurations')
    #     binding.pry

    # end
end