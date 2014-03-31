require 'spec_helper'
require_relative 'helpers/session'

include SessionHelpers

feature "User profile" do

  before(:each) {
     @link1 = Link.create( :url => "http://www.google.com", 
       :title => "Google",
       :tags => [Tag.first_or_create(:text => 'search')])
     @user = User.create(:username => 'Test', :email => 'test@test.com', :password => 'test', :password_confirmation => 'test')
   } 

  scenario "links, tags and favourites are displayed" do
    visit ('/')
    sign_in('test@test.com', 'test') 
    visit ('/users/1')
    p @user
    expect(page).to have_content('search')
  end

end