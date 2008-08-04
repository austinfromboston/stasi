module SearchHelper
  def current_search
    return current_model unless params[:query] || params[:year] || params[:month]
    search = current_model
    year_param = params[:year] || ( params[:query] && params[:query][:year] ) 
    month_param = params[:month] || ( params[:query] && params[:query][:month] ) 
    search = search.from_year( year_param ) if year_param
    search = search.from_month( month_param ) if month_param
    search
  end
end
