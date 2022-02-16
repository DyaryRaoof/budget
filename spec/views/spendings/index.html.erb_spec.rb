require 'rails_helper'

RSpec.describe 'Spendings index Page', type: :system do

  describe 'show' do
    before(:each) do
      visit new_user_session_path
      fill_in 'Email', with: 'dyary2020@gmail.com'
      fill_in 'Password', with: '123456'
      find('input[name="commit"]').click
      visit group_spendings_path(Group.first.id)
    end

    it "Can see Food" do
      expect(page).to have_content 'Food'
    end

    it "Can see $ 11" do
      expect(page).to have_content '$ 11.0'
    end


    it "Can see Group 1" do
      expect(page).to have_content '$ 11.0'
    end


    it "Can see $ 55" do
      expect(page).to have_content '$ 11.0'
    end
  end
end