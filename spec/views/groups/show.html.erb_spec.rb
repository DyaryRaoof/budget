require 'rails_helper'

RSpec.describe 'Group Show Page', type: :system do
  describe 'show' do
    before(:each) do
      visit new_user_session_path
      fill_in 'Email', with: 'dyary2020@gmail.com'
      fill_in 'Password', with: '123456'
      find('input[name="commit"]').click
    end

    it 'Can see 3 groups' do
      group_card = page.all('div', class: 'single-group-card')[0]
      group_card.click
      expect(page).to have_current_path(group_spendings_path(Group.first.id))
    end

    it 'Can see Food' do
      expect(page).to have_content 'Group 1'
    end

    it 'Can see Food' do
      expect(page).to have_content '$ 55.0'
    end
  end
end
