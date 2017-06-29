require 'rails_helper'

RSpec.describe HomeController, :type => :controller do
  render_views

  let(:json) { JSON.parse(response.body).first }

  describe "GET /geocode" do
    context 'empty search string' do
      it 'returns nothing' do
        get :geocode, format: :json
        expect(json[1]).to be_empty
      end
    end

    context 'fullfilled search string' do
      it 'returns an address, coordinates correctly' do
        get :geocode, search: "address='Konstytutsii square 9'", format: :json
        expect(json[1]).to be_present
        expect(json[1][0]['address']).to include('Konstytutsii Square, 9,')
        expect(json[1][0]['latidue']).to eq(49.99083299999999)
        expect(json[1][0]['longitude']).to eq(36.23212)
      end
    end

    context 'incorrect address in search string' do
      it 'returns the listings' do
        get :geocode, search: "address=''", format: :json
        expect(json[1]).to be_empty
      end
    end
  end
end
