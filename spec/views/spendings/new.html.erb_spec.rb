require 'rails_helper'

RSpec.describe 'Groups new page', type: :system do

  describe 'new' do
    before(:each) do
      visit new_user_session_path
      fill_in 'Email', with: 'dyary2020@gmail.com'
      fill_in 'Password', with: '123456'
      find('input[name="commit"]').click
    end

    it 'redirects to the groups page' do
      visit new_group_spending_path(Group.first.id)
      fill_in 'Name', with: 'Transaction 2'
      fill_in 'Amount', with: 22
      check('spending_group_ids_3')
      find('input[name="commit"]').click
      expect(page).to have_current_path(group_spendings_path(Group.first.id))
    end


    it 'Can shows notice of You should select at least one category' do
      visit new_group_spending_path(Group.first.id)
      fill_in 'Name', with: 'Transaction 2'
      fill_in 'Amount', with: 22
      find('input[name="commit"]').click
      expect(page).to have_content('You should select at least one category')
    end

  end
end