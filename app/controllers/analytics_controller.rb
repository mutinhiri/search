class AnalyticsController < ApplicationController
  def index
    logs = SearchQuery.group(:query).order('count_all DESC').count
    render json: logs
  end
end
