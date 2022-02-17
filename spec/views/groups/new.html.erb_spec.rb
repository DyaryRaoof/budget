require 'rails_helper'

RSpec.describe 'Groups new page', type: :system do
  describe 'new' do
    before(:each) do
      visit new_user_session_path
      fill_in 'Email', with: 'dyary2020@gmail.com'
      fill_in 'Password', with: '123456'
      find('input[name="commit"]').click
    end

    it 'Can see 3 groups' do
      visit new_group_path
      fill_in 'Name', with: 'Group 10'
      fill_in 'Icon', with: 'https://www.shareicon.net/data/128x128/2017/07/13/888381_globe_512x512.png'
      find('input[name="commit"]').click
      expect(page).to have_current_path(groups_path)
    end
  end
end
