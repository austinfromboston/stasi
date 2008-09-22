# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def months
    (1..12).map { |mm| Time.mktime( 2008, mm, 1 ).strftime('%B-%m').split('-')  }
  end

  def recent_years
    (2006..Time.now.strftime('%Y').to_i).to_a.reverse.map{|yy| yy.to_s }
  end

  def searchable_projects
    project_options.unshift( [ 'Search by Project', nil ], [ 'unassigned', 'unassigned' ] )
  end
  def active_projects
    Project.all( :order => 'organization ASC' )
  end

  def agent_options
    Agent.all(:order => 'name ASC').map { |a| [ a.name, a.id ] }
  end

  def project_options
    active_projects.map{ |prj| [ prj.organization[0..30], prj.id ] }
  end


end
