class MostDangerousDayController < ApplicationController
  def index
    @start_date = (params[:start_date]).to_date.strftime("%B %d, %Y")
    @end_date = (params[:end_date]).to_date.strftime("%B %d, %Y")
    render locals: {
      facade: AsteroidSearch.new(params[:start_date].to_date.strftime, params[:end_date].to_date.strftime)
    }
  end
end
