require "rails_helper"

RSpec.describe PublishersController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/publishers").to route_to("publishers#index")
    end

    it "routes to #show" do
      expect(:get => "/publishers/1").to route_to("publishers#show", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/publishers").to route_to("publishers#create")
    end

    it "routes to #update" do
      expect(:put => "/publishers/1").to route_to("publishers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/publishers/1").to route_to("publishers#destroy", :id => "1")
    end

  end
end
