class BasecampImportsController < ApplicationController
  def create
    new_hours = basecamp_projects.map { |p| p.update_basecamp_hours }.flatten.compact
    respond_to do |format|
      format.html do
        flash[:notice] = "Updated #{basecamp_projects.size} projects with #{new_hours.size} logs"
        redirect_to basecamp_imports_path and return
      end
      format.js do
        render :json => new_hours
      end
    end
  end

  def index
    @projects = basecamp_projects
  end

  private
  def basecamp_projects
    @basecamp_projects ||= Project.all :conditions => [ 'basecamp_id is not ?', nil ]
  end
end
