require 'uri'
require 'net/http'

class Api::MemeFetcherService
  API_URL = "https://humor-jokes-and-memes.p.rapidapi.com/memes/random?keywords=rocket&number=3&media-type=image&keywords-in-image=false&min-rating=4"
  API_KEY = '20f2c72233msheffc524063828e9p116c52jsn601f05782ace'
  API_HOST = 'humor-jokes-and-memes.p.rapidapi.com'

  def self.fetch_memes
    url = URI(API_URL)
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    request = Net::HTTP::Get.new(url)
    request["x-rapidapi-key"] = API_KEY
    request["x-rapidapi-host"] = API_HOST
    
    response = http.request(request)
    JSON.parse(response.read_body)
  rescue StandardError => e
    Rails.logger.error("API Request Failed: #{e.message}")
    []
  end
end
