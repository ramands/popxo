class TracksController < ApplicationController
	def initialize
		#initialize the Souncloud client object.
		@client = Soundcloud.new(:client_id => SOUNDCLOUD_CLIENT_ID)
	end

	def index
	end

	#plays the track
	def show
		track_id = params[:id]
		#create the track link
		track_link = @client.get('/tracks/'+track_id.to_s).permalink_url
		#create the embed info for the above track link
		embed_info = @client.get('/oembed?auto_play=true', :url => track_link)
		@embed_code = embed_info['html']
	end
end
