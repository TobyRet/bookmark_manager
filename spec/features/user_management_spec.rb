require 'spec_helper'

  feature "User signs up" do 

    scenario "when being logged out" do
      lambda { sign_up }.should change(User, :count).by(1)
      expect(page).to have_content("Welcome, toby@example.com")
      expect(User.first.email).to eq("toby@example.com")
    end

    def sign_up(email = "toby@example.com", password = "Toby")
      visit '/users/new'
      fill_in :email, :with => email
      fill_in :password, :with => password
      click_button "Sign up"
    end

  end