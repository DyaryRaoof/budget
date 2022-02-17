require 'rails_helper'
RSpec.describe '/spendings', type: :request do
  before(:each) do
    sign_in User.first
  end

  describe 'GET /spending' do
    it 'works! returns correct status code' do
      get group_spendings_path(Group.first.id)
      expect(response).to have_http_status(200)
    end

    it 'works!  renders index view correctly' do
      get group_spendings_path(Group.first.id)
      expect(response).to render_template(:index)
    end

    it 'works! reponse body includes Food' do
      get group_spendings_path(Group.first.id)
      expect(response.body).to include('Food')
    end
  end
end
