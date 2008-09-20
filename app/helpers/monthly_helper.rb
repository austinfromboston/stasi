module MonthlyHelper

  def project_total_heading(log)
    return if log.project.nil? or @grouped_by_project.nil? or @current_project_heading && ( @current_project_heading == log.project ) 
    @current_project_heading = log.project 

    @project_logs = @grouped_by_project[ log.project ]
    return log.project.display_name unless @project_logs
    total_minutes = (@project_logs.sum { | plog| plog.minutes || 0 })
     
    base_heading = "#{log.project.display_name}  &mdash; #{total_minutes.minutes.to_f / 1.hour } hours"
    total_charges = (@project_logs.sum { |plog| plog.charges || 0 }) 
    return base_heading unless total_charges && total_charges > 0 

    "#{base_heading} &mdash; #{"$%0.2f" % total_charges}"

  end

  def next_month_path
    base_time = params[:month] ? Time.mktime( params[:year], params[:month] ).next_month : Time.now.next_month
    monthly_path_for_time( base_time )
  end
  def last_month_path
    base_time = params[:month] ? Time.mktime( params[:year], params[:month] ).last_month : Time.now.last_month
    monthly_path_for_time( base_time )
  end

  def current_month_path
    monthly_path_for_time( Time.now )
  end

  def monthly_path_for_time(base_time)
    url_for :controller => 'monthly', :action => 'index', :year => base_time.strftime('%Y'), :month => base_time.strftime('%m')
  end
end
