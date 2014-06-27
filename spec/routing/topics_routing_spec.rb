require "spec_helper"

describe TopicsController do
  describe "routing" do

    it "routes to #index" do
      expect(get: '/topics').to route_to(controller: 'topics', action: 'index')
    end

    it "routes to #new" do
      expect(get: '/topics/new').to route_to(controller: 'topics', action: 'new')
    end

    it "routes to #show" do
      expect(get: '/topics/1').to route_to(controller: 'topics', action: 'show', id: '1')
    end

    it "routes to #create" do
      expect(post: '/topics').to route_to(controller: 'topics', action: 'create')
    end
  end
end
