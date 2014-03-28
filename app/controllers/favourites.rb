post '/favourites' do
  user = User.get(session[:user_id])
  link = Link.get(params[:link_id])
  favourites = user.links
  favourites << link
  user.update(:link => favourites)
  redirect to ('/')
end