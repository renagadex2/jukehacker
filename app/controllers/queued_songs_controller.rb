class QueuedSongsController < ApplicationController
  include GroovesharkSearchHelper
  
  def create
    
  end 

  def get_queue
    @party = Party.find(request.referer.split("/").last.to_i)
    render json: @party.upcoming_songs
  end

end 
