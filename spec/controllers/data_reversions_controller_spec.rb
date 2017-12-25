require 'rails_helper'

RSpec.describe 'DataReversionsController', type: :request do
  it 'reverse data route must work' do
    assert_generates '/collect/data', controller: 'data_reversions',
      action: 'convert'
  end

  it 'reverse_data route helpers must work' do
    post reverse_data_path(data: { hey: 'You' })
    res1 = response.body
    post reverse_data_url(data: { hey: 'You' })
    res2 = response.body
    post '/collect/data', params: { data: { hey: 'You' } }
    res3 = response.body
    expect(res1).to eq res2
    expect(res2).to eq res3
  end

  it 'route should respond with success' do
    post '/collect/data'
    expect(response.status).to eq 200
  end

  it 'data should be processible and returned in json format' do
    post '/collect/data', params: { data: { one: 'One', two: 'Two' } }
    expect(response).to be_success
    expect(response.body).to eq({ one: 'enO', two: 'owT' }.to_json)
  end
end
