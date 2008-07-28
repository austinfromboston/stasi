class InvolvementsController < ApplicationController
  def create
    @contact = Contact.find( params[:contact_id ] )
    @contact.project = Project.find( params[:project_id] )
    respond_to do |format|
      if @contact.save
        format.json { render  :json => @contact.to_json( :include => :project ), :status => :created, :location => @contact }
      else
        format.json { render :json   => @contact.errors, :status => :unprocessable_entity }
      end
    end
  end
end
