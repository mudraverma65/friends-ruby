class HomeController < ApplicationController
	require 'net/http'
	require 'json'
	def index

		url = URI("https://meme-api.com/gimme")
		response = Net::HTTP.get(url)
		meme_data = JSON.parse(response)

		if response_successful?(meme_data)
			@home_meme = {
				'url' => meme_data['url'],
				'title' => meme_data['title'],
				'author' => meme_data['author']
			}
		else
			@home_meme = nil
			flash[:alert] = "No meme available at the moment."
		end

		render :index
	end

	private

	def response_successful?(meme_data)
		meme_data['url'].present? && meme_data['title'].present? && meme_data['author'].present?
	end
end