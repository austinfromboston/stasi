class HourLogsController < ApplicationController
  make_resourceful do 
    actions :all
  end
  include SearchHelper

  def current_objects
    @project_totals = [] 
    @project_totals = current_search.sum :minutes, :group => 'project_id', :order => 'sum_minutes DESC', :include => 'project'
    current_search.paginate :page => params[:page], :order => "hour_logs.created_at DESC" 
  end
end

