require "spec_helper"

describe MarksController do
  describe "routing" do

    it "routes to #index" do
      expect(get: '/marks').to route_to(controller: 'marks', action: 'index')
    end

    it "routes to #new_mark" do
      expect(get: '/marks/new_mark').to route_to(controller: 'marks', action: 'new_mark')
    end
  end
end
