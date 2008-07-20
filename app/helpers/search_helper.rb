module SearchHelper
  def current_search
    return current_model unless params[:query]
    search = current_model
    search = search.from_year( params[:query][:year] ) if params[:query][:year]
    search = search.from_month( params[:query][:month] ) if params[:query][:month]
    search
  end
end
