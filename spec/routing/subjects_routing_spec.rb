require "spec_helper"

describe SubjectsController do
  describe "routing" do

    it "routes to #index" do
      expect(get: '/subjects').to route_to(controller: 'subjects', action: 'index')
    end

    it "routes to #new" do
      expect(get: '/subjects/new').to route_to(controller: 'subjects', action: 'new')
    end

    it "routes to #show" do
      expect(get: '/subjects/1').to route_to(controller: 'subjects', action: 'show', id: '1')
    end

    it "routes to #edit" do
      expect(get: '/subjects/1/edit').to route_to(controller: 'subjects', action: 'edit', id: '1')
    end

    it "routes to #create" do
      expect(post: '/subjects').to route_to(controller: 'subjects', action: 'create')
    end

    it "routes to #update" do
      expect(put: '/subjects/1').to route_to(controller: 'subjects', action: 'update', id: '1')
    end

    it "routes to #destroy" do
      expect(delete: '/subjects/1').to route_to(controller: 'subjects', action: 'destroy', id: '1')
    end
  end
end
