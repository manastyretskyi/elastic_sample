require 'rails_helper'

RSpec.describe "Searches", type: :request do
  describe '#search', elasticsearch: true do
    let!(:book) { create(:book, title: 'book to return') }

    before { import_records }
    after { clear_indices }
    
    it 'returns correct results' do
      headers = { "ACCEPT" => "application/json" }
      post '/search.json', params: { term: 'to return' }

      expect(response.content_type).to eq("application/json; charset=utf-8")
      expect(response.body).to include('book to return')
    end
  end
end
