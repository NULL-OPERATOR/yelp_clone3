def sign_up
  visit '/'
  click_link 'Signup'
  fill_in 'Email', with: 'aah@aah.com'
  fill_in 'Password', with: '12341234'
  fill_in 'Password confirmation', with: '12341234'
  click_button 'Sign up'
end


def create_restaurant
  visit '/restaurants'
  click_link 'Add a restaurant'
  fill_in 'Name', with: 'KFC'
  click_button 'Create Restaurant'
end
