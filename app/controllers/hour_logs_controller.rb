class HourLogsController < ApplicationController
  make_resourceful do 
    actions :all
  end

  def current_objects
    search_options = { :page => params[:page], :order => "created_at DESC" }
    return HourLog.paginate( search_options ) unless params[:query]
    search = HourLog
    search = search.from_year( params[:query][:year] ) if params[:query][:year]
    search = search.from_month( params[:query][:month] ) if params[:query][:month]
    search.paginate search_options
  end
end

