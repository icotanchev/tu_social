require "spec_helper"

describe MessagesController do
  describe "routing" do

    it "routes to #index" do
      expect(get: '/messages').to route_to(controller: 'messages', action: 'index')
    end

    it "routes to #new" do
      expect(get: '/messages/new').to route_to(controller: 'messages', action: 'new')
    end

    it "routes to #show" do
      expect(get: '/messages/1').to route_to(controller: 'messages', action: 'show', id: '1')
    end

    it "routes to #create" do
      expect(post: '/messages').to route_to(controller: 'messages', action: 'create')
    end

    it "routes to #destroy" do
      expect(delete: '/messages/1').to route_to(controller: 'messages', action: 'destroy', id: '1')
    end
  end
end
