get '/users/new' do
  @user = User.new
  erb :"users/new", :layout => !request.xhr?
end

#not sure why this is not working. Lists same link for all users. Gets does not work?
get '/users/:id' do
  user = User.first(:id => params[:id]) 
  @links = user ? user.links : []
  erb :index
end

post '/users' do 
  @user = User.create(:username => params[:username], :email => params[:email], :password => params[:password], :password_confirmation => params[:password_confirmation])
  if @user.save
    session[:user_id] = @user.id
    redirect to('/')
  else
    flash.now[:errors] = @user.errors.full_messages
    erb :"users/new"
  end
end