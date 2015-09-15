require 'rails_helper'

RSpec.describe "Publishers", :type => :request do
  describe "GET /publisher" do
    it "returns all the publishers" do
      FactoryGirl.create :publisher, name: 'Manning'
      FactoryGirl.create :publisher, name: 'Pragmatic Bookshelf'

      get '/publishers'

      expect(response.status).to eq 200

      body = JSON.parse(response.body)
      publisher_names = body['data'].map{|d| d['attributes']['name'] }
      expect(publisher_names).to match_array(['Manning', 'Pragmatic Bookshelf'])
    end
  end

  describe "GET /publishers/:id" do
    it "returns the specified publisher" do
      FactoryGirl.create :publisher, name: 'Manning', id: 1

      get '/publishers/1'

      expect(response.status).to eq 200

      body = JSON.parse(response.body)

      publisher_name = body['data']['attributes']['name']
      expect(publisher_name) == 'Manning'
    end
  end

  describe "POST /publishers" do
    it "creates the specified publisher" do
      json = '{
        "data":
          {
            "type": "publishers",
            "attributes": {
              "name": "Manning"
            }
          }
        }'

      post '/publishers',
        params: json,
        headers: { 'Content-Type': 'application/vnd.api+json' }

      expect(response.status).to eq 201

      body = JSON.parse(response.body)

      publisher_name = body['data']['attributes']['name']
      expect(publisher_name) == 'Manning'
    end
  end

  describe "PUT /publishers/1" do
    it "updates the specified publisher" do
      FactoryGirl.create :publisher, name: 'Manning', id: 1

      json = '{
        "data":
          {
            "type": "publishers",
            "id": 1,
            "attributes": {
              "name": "Pragmatic Bookshelf"
            }
          }
        }'

      put '/publishers/1',
        params: json,
        headers: { 'Content-Type': 'application/vnd.api+json' }

      expect(response.status).to eq 200

      body = JSON.parse(response.body)

      publisher_name = body['data']['attributes']['name']
      expect(publisher_name) == 'Pragmatic Bookshelf'
    end
  end

  describe "DELETE /publishers/:id" do
    it "deletes the specified publisher" do
      FactoryGirl.create :publisher, name: 'Manning', id: 1

      delete '/publishers/1'

      expect(response.status).to eq 204
    end
  end
end
