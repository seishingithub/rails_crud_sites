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

  scenario 'User can edit and update list of tourist sites' do
    visit '/'
    click_on 'Add Tourist Site'
    fill_in 'Site name', with: 'Eiffel Tower'
    fill_in 'Location', with: 'Paris, France'
    click_on 'Create Tourist Site'
    expect(page).to have_content 'Eiffel Tower'
    expect(page).to have_content 'Paris, France'
    click_on 'Eiffel Tower'
    expect(page).to have_content 'Eiffel Tower'
    expect(page).to have_content 'Paris, France'
    click_on 'Edit'
    fill_in 'Site name', with: 'Golden Gate Bridge'
    fill_in 'Location', with: 'San Fran, CA'
    click_on 'Update'
    expect(page).to have_content 'Golden Gate Bridge'
    expect(page).to have_content 'San Fran, CA'
  end

  scenario 'User can delete sites from list of tourist sites' do
    visit '/'
    click_on 'Add Tourist Site'
    fill_in 'Site name', with: 'Eiffel Tower'
    fill_in 'Location', with: 'Paris, France'
    click_on 'Create Tourist Site'
    expect(page).to have_content 'Eiffel Tower'
    expect(page).to have_content 'Paris, France'
    click_on 'Eiffel Tower'
    expect(page).to have_content 'Eiffel Tower'
    expect(page).to have_content 'Paris, France'
    click_on 'Delete'
    expect(page).to have_no_content 'Eiffel Tower'
    expect(page).to have_no_content 'Paris, France'
  end
end