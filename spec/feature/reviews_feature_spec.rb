require 'rails_helper'

feature 'reviewing' do


  scenario 'allows users to leave a review using a form' do
    sign_up
    create_restaurant
    visit '/restaurants'
    click_link 'Review KFC'
    fill_in "Thoughts", with: "too fry"
    select '3', from: 'Rating'
    click_button 'Leave Review'
    expect(current_path).to eq '/restaurants'
    expect(page).to have_content('too fry')
  end

  scenario 'cant submit more than one review per restaurant' do
    visit '/'
    click_link 'Signup'
    fill_in 'Email', with: 'aah@aah.com'
    fill_in 'Password', with: '12341234'
    fill_in 'Password confirmation', with: '12341234'
    click_button 'Sign up'

    visit '/restaurants'
    click_link 'Edit KFC'
    expect(page).to have_content "Unauthorised access"
  end


  # scenario 'cant submit more than one review per restaurant' do
  #   sign_up
  #   visit '/restaurants'
  #   click_link 'Review KFC'
  #   expect(page).to have_content "Can only add one review"
  # end


end
