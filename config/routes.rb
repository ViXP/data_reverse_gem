Rails.application.routes.draw do
  post '/collect/data' => 'data_reversions#convert', as: :reverse_data
end
