require 'rails_helper'

RSpec.describe '/groups', type: :request do
  before(:each) do
    sign_in User.first
  end

  describe 'GET /groups' do
    it 'works! returns correct status code' do
      get groups_path
      expect(response).to have_http_status(200)
    end

    it 'works!  renders index view correctly' do
      get groups_path
      expect(response).to render_template(:index)
    end

    it 'works! reponse body includes Group 1' do
      get groups_path
      expect(response.body).to include('Group 1')
    end
  end
end
