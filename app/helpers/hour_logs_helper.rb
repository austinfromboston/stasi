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
    tasks.sort! { |a, b| a[:description] <=> b[:description] }
    stories = tasks.inject({}) do |compressed_tasks, current|
      task_header = current[:description].split("\n")[0]
      compressed_tasks[task_header] ||= { :story => task_header, :description => '', :minutes => 0.to_f }
      details = current[:description].split("\n")[1..-1]
      compressed_tasks[task_header][:description] +=  "; " + details.delete_if(&:blank?).join("; ") unless details.empty?
      compressed_tasks[task_header][:minutes] += current[:minutes]
      compressed_tasks
    end
    stories.values.each { |v| v[:description].gsub!(/^; /,'') }
  end
end
