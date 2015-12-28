class PlaylistsController < ApplicationController 

	def initialize
		#initialize the Souncloud client object.
		@client = Soundcloud.new(:client_id => SOUNDCLOUD_CLIENT_ID)
	end

	# returns all playlists of a user
	def index
		# get playlists of a user, say 'knifepartyinc', and add only relevant data to the @playlists array
		playlists_from_soundcloud = @client.get('/users/knifepartyinc/playlists')
		@playlists = []
		playlists_from_soundcloud.each { |playlist|
			@playlists.push({"name"=>playlist.title,"link"=>"/playlists/" + playlist.id.to_s })
		}
	end

	# returns playlist details
	def show
		playlist_id = params[:id]
		#get playlist details
		@playlist_details = @client.get('/playlists/'+playlist_id.to_s)
	end

end
