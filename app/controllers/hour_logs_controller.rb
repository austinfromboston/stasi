class HourLogsController < ApplicationController
  make_resourceful do 
    actions :all
    before :new do
      current_object.agent = current_user
    end
    response_for :index do |format|
      format.html {}
      format.pdf  do 
        @hour_logs = current_search.all
        self.class.layout nil
        #prawnto :filename => "#{@project.display_name.underscore}
        prawnto :filename => "#{@project.display_name.downcase.gsub(/\s/,'_')}_hours_report_#{Time.now.year}_#{Time.now.month}_#{Time.now.day}.pdf"
      end
    end

  end
  include SearchHelper

  def current_search
    return super unless params[:project_id]
    @project = Project.find( params[:project_id] )
    super( @project.hour_logs )
  end

  def current_objects
    @project_totals = [] 
    @project_totals = current_search.sum :minutes, :group => 'project_id', :order => 'sum_minutes DESC', :include => 'project'
    current_search.paginate :page => params[:page], :order => "hour_logs.created_at DESC" 
  end
end

