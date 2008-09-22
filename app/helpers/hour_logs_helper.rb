module HourLogsHelper
  def to_hours( minutes )
    minutes.minutes.to_f / 1.hours
  end

  def current_view_dates
    return { :query => { :year => params[:year], :month => params[:month] }} if params[:year] && params[:month] 
    return { :query => { :year => params[:year] }} if params[:year] 
    {}
  end

  def condense_by_description( logs )
    tasks = logs.inject([]) do |tasks, log|
      if current_task = tasks.find{ |t| t[:description] == log.notes.strip }
        current_task[:minutes] += log.minutes
      else
        tasks << { :description => log.notes.strip, :minutes => log.minutes }
      end
      tasks
    end
    tasks.sort { |a, b| b[:minutes] <=> a[:minutes] }
  end
end
