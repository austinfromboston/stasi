class TicketsController < ApplicationController
  make_resourceful do 
    actions :all
    response_for :show do |format|
      format.html 
      format.json { render :json => current_object }
    end
  end
  include SearchHelper

  def current_objects
    current_search.paginate :page => params[:page], :order => "created_at DESC" 
  end
end


