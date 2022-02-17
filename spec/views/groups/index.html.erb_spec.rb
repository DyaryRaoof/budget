require 'rails_helper'

RSpec.describe 'Group Index Page', type: :system do
  describe 'index' do
    before(:each) do
      visit new_user_session_path
      fill_in 'Email', with: 'dyary2020@gmail.com'
      fill_in 'Password', with: '123456'
      find('input[name="commit"]').click
    end

    it 'Can see 3 groups' do
      group_images = page.all('img', id: 'group_icon')
      expect(group_images.length).to eq 3
    end

    it 'Can see the icon image' do
      image = page.all('img', id: 'group_icon')[0]
      expect(image['src']).to have_content 'shareicon.net'
    end

    it 'Can see Group 1' do
      expect(page).to have_content 'Group 1'
    end

    it 'Can see group total transactions' do
      expect(page).to have_content '$ 55.0'
    end

    it 'Can see CATEGORIES' do
      expect(page).to have_content 'CATEGORIES'
    end

    it 'Can see CATEGORIES' do
      expect(page).to have_link 'New Category'
    end
  end
end
