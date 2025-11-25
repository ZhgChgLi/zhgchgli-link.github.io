require_relative 'Plugin'
require 'net/http'
require 'nokogiri'
require 'uri'

class MediumFollowersCountPlugin < Plugin
    attr_reader :data, :username
      
    def initialize(data)
        @data = data
        @username = data[0]["username"]
    end

    def execute
        return load_medium_followers("https://medium.com/@#{@username}/followers")
    end


    def load_medium_followers(url, limit = 10)
        puts url
        return 0 if limit.zero?

        uri = URI(url)
        request = Net::HTTP::Get.new(uri)
        
        request["Cookie"] = "uid=#{ENV['MEDIUM_COOKIE_UID']}; sid=#{ENV['MEDIUM_COOKIE_SID']}"
        response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == "https") do |http|
            http.request(request)
        end
    
        puts response.body
        
        case response
        when Net::HTTPSuccess then
            document = Nokogiri::HTML(response.body)
            document.css('h2').each do |h2|
                if h2.text.strip.downcase.end_with?('followers')
                    return h2.text.strip.sub(/followers\z/i, '').strip
                end
            end
        when Net::HTTPRedirection then
            location = response['location']
            return self.load_medium_followers(location, limit - 1)
        else
            return 0
        end
    end

end
