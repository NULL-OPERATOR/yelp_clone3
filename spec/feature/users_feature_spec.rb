require 'rails_helper'
sign_in_msg = 'Sign in'
sign_out_msg = 'Sign out'
sign_up_msg = 'Sign up'

feature "User can sign in and out" do

  context "user not signed in and on the homepage" do
    it "should see a 'sign in' link and a 'sign up' link" do
      visit('/')
      expect(page).to have_link(sign_in_msg)
      expect(page).to have_link(sign_up_msg)
    end

    it "should not see 'sign out' link" do
      visit('/')
      expect(page).not_to have_link(sign_out_msg)
    end
  end

  context "user signed in on the homepage" do
    before do
      sign_up
    end

    it "should see 'sign out' link" do
      visit('/')
      expect(page).to have_link(sign_out_msg)
    end

    it "should not see a 'sign in' link and a 'sign up' link" do
      visit('/')
      expect(page).not_to have_link(sign_in_msg)
      expect(page).not_to have_link(sign_up_msg)
    end
  end


end
