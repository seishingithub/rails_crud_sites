require 'spec_helper'

feature 'Manage Sites' do
  scenario 'User can create and view list of tourist sites' do
    visit '/'
    expect(page).to have_content 'Welcome'
    click_on 'Add Tourist Site'
    fill_in 'Site name', with: 'Eiffel Tower'
    fill_in 'Location', with: 'Paris, France'
    click_on 'Create Tourist Site'
    expect(page).to have_content 'Eiffel Tower'
    expect(page).to have_content 'Paris, France'
  end
end