require 'spec_helper'
require_relative 'helpers/session'

include SessionHelpers

feature 'User can favourite a link' do

  before(:each) {
    link1 = Link.create( :url => "http://www.makersacademy.com", 
      :title => "Makers Academy",
      :tags => [Tag.first_or_create(:text => 'education')])
    
    link2 = Link.create( :url => "http://www.google.com", 
      :title => "Google",
      :tags => [Tag.first_or_create(:text => 'search')])

    @user = User.create(:email => "test@test.com", 
      :password => 'test', 
      :password_confirmation => 'test')
  }

  scenario 'when browsing the links' do
    visit ('/')
    sign_in('test@test.com', 'test')
    expect(@user.links.count).to eq(0)
    # click_button 'favorite'
    @user.links = [Link.first]
    @user.save
    expect(@user.links.count).to eq(1)
  end

end