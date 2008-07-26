class ProjectsController < ApplicationController
  make_resourceful do
    actions :all
  end

  def current_objects
    Project.all :order => 'organization ASC, name ASC'
  end
end
