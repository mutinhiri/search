class SearchController < ApplicationController
  def index
    query = params[:q].to_s.strip
    ip = request.remote_ip

    return head :bad_request if query.blank?

    session = SearchParam.find_or_initialize_by(ip: ip)

    if session.last_search.present? && query.start_with?(session.last_search)
      # User is still typing – do not log
      session.update!(last_search: query)
    else
      # It's a final query or a fresh query
      SearchQuery.create!(ip: ip, query: query)
      session.update!(last_search: query)
    end

    render json: { status: ' search query logged' }
  end
end
