class SlowFoodApp
  get '/' do
    erb :welcome
  end

  get '/login' do

  end

  get '/signup' do
    erb :signup
  end

  get '/users' do
    @users = User.all
    erb :users_index
  end
end
