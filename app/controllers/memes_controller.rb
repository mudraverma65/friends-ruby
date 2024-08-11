class MemesController < ApplicationController
  def index
    @meme = fetch_memes
  end

  # def new_meme
  #   @meme = fetch_memes
  #   respond_to do |format|
  #     format.js # This will look for a file named `new_meme.js.erb`
  #   end
  # end

  private

  def fetch_memes
    require 'uri'
    require 'net/http'

    url = URI("https://humor-jokes-and-memes.p.rapidapi.com/memes/random?keywords=rocket&number=3&media-type=image&keywords-in-image=false&min-rating=4")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request["x-rapidapi-key"] = '9eeabd3ebdmsh2d8d9a8730f6ceep123088jsnb48c14de2a8a'
    request["x-rapidapi-host"] = 'humor-jokes-and-memes.p.rapidapi.com'

    response = http.request(request)
  #   memes = JSON.parse(response.body)
 	# @meme = memes.is_a?(Array) ? memes.first : memes # Ensure `@meme` is a single item
    
 	if response.is_a?(Net::HTTPSuccess)
 		memes = JSON.parse(response.body)
 		@meme = memes.is_a?(Array) ? memes.first : memes # Ensure `@meme` is a single item
    else
      	@meme = nil
    end
    
  end
end
