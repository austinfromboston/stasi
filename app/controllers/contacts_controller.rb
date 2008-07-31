class ContactsController < ApplicationController
  make_resourceful do 
    actions :all
    response_for :destroy do |format|
      format.html { redirect_to contacts_path }
      format.json { head :ok }
    end

  end

  def current_objects
    search_options = { :order => 'name ASC, email ASC', :include => :tickets  }
    return Contact.all( search_options ) unless params[:query]
    search = Contact
    if params[:query] and !params[:query][:project_id].blank?
      if params[:query][:project_id] == 'unassigned'
        search = search.unassigned
      else
        search = Project.find( params[:query][:project_id] ).contacts
      end
    end
    search.all( search_options )
  end
end


