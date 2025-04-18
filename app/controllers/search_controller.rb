class SearchController < ApplicationController
  def index
    query = params[:q].to_s.strip
    ip = request.remote_ip

    return head :bad_request if query.blank?

    session = SearchParam.find_or_initialize_by(ip: ip)

    if query == session.last_search
     
    elsif session.last_search.present? && query.start_with?(session.last_search)
    
      session.update!(last_search: query)
    else
  
      SearchQuery.create!(ip: ip, query: query)
      session.update!(last_search: query)
    end

    render json: { status: 'query logged if complete' }
  end
end