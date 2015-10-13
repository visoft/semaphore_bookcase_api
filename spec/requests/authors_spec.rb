require 'rails_helper'

RSpec.describe "Authors", :type => :request do
  describe "GET /authors" do
    it "returns all the authors" do
      FactoryGirl.create :author, name: 'John Doe'
      FactoryGirl.create :author, name: 'Damien White'

      get '/authors'

      expect(response.status).to eq 200

      body = JSON.parse(response.body)
      author_names = body['data'].map{|author| author['attributes']['name'] }
      author_ids = body['data'].map{|author| author['id'] }
      expect(author_names).to match_array(['John Doe', 'Damien White'])
      expect(author_ids).to match_array(["1", "2"])
    end
  end

  describe "GET /authors/:id" do
    it "returns the specified author" do
      FactoryGirl.create :author, name: 'John Doe', id: 1

      get '/authors/1'

      expect(response.status).to eq 200

      body = JSON.parse(response.body)

      author_name = body['data']['attributes']['name']
      expect(author_name) == 'John Doe'
    end
  end

  describe "POST /authors" do
    it "creates the specified author" do
      author = {
        data: {
          type: "authors",
          attributes: {
            name: "John Doe"
          }
        }
      }

      post '/authors',
        params: author.to_json,
        headers: { 'Content-Type': 'application/vnd.api+json' }

      expect(response.status).to eq 201

      body = JSON.parse(response.body)

      author_name = body['data']['attributes']['name']
      expect(author_name) == 'John Doe'
    end
  end

  describe "PUT /authors/:id" do
    it "updates the specified author" do
      FactoryGirl.create :author, name: 'John Doe', id: 1

      author = {
        data: {
          type: "authors",
          id: 1,
          attributes: {
            name: "Damien White"
          }
        }
      }

      put '/authors/1',
        params: author.to_json,
        headers: { 'Content-Type': 'application/vnd.api+json' }

      expect(response.status).to eq 200

      body = JSON.parse(response.body)

      author_name = body['data']['attributes']['name']
      expect(author_name) == 'Damien White'
    end
  end

  describe "DELETE /authors/:id" do
    it "deletes the specified author" do
      FactoryGirl.create :author, name: 'John Doe', id: 1

      delete '/authors/1'

      expect(response.status).to eq 204
    end
  end
end
