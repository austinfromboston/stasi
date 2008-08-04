require 'faster_csv'
class MonthlyController < HourLogsController
  include SearchHelper
  make_resourceful do
    actions :index
    before  :index do
      redirect_to :month => Time.now.strftime('%m'), :year => Time.now.strftime('%m') unless params[:month] and params[:year]
    end
    response_for :index do | format |
      format.html
      format.csv do 
        @csv_output = FasterCSV.generate do |csv|
          csv << [ 'project_id', 'client_id', 'staff', 'task', 'description', 'time', 'time_over', 'rate', 'charges' ]
          @hour_logs.each do |log|
            csv << [ log.project_id, nil, log.agent.display_name, log.billing_type, log.notes, log.minutes, nil, nil, nil ]
          end
        end
        render :text => @csv_output
      end

    end
  end

  def current_model_name
    "HourLog"
  end

  def load_objects
    @hour_logs = current_objects
  end
  def current_objects
    super
    current_search.all :include => :project, :order => 'if((projects.name != ""), projects.name, projects.organization)  ASC'
  end
end
