class DataReversionsController < ActionController::Base
  def convert
    data = DataReversion.process(params[:data])
    render json: data, status: :ok
  end
end
