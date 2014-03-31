post '/favourites' do
  user = User.get(session[:user_id])
  link = Link.get(params[:link_id])
  user.links << link
  user.save
  redirect to ('/')
end