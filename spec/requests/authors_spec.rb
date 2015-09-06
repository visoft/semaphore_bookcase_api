require 'rails_helper'

RSpec.describe "Authors", :type => :request do
  describe "GET /authors" do
    it "returns all the authors" do
      FactoryGirl.create :author, name: 'John Doe'
      FactoryGirl.create :author, name: 'Damien White'

      get '/authors'

      expect(response.status).to eq 200

      body = JSON.parse(response.body)
      author_names = body['data'].map{| d| d['attributes']['name'] }
      expect(author_names).to match_array(['John Doe', 'Damien White'])
    end
  end
end
