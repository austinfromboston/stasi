class HourLogsController < ApplicationController
  make_resourceful do 
    actions :all
  end
  include SearchHelper

  def current_objects
    current_search.paginate :page => params[:page], :order => "created_at DESC" 
  end
end

