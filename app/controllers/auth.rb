class SlowFoodApp
  get '/' do
    erb :welcome
  end

  get '/login' do

  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    @new_user = User.new(name: params['user']['username'], password: params['user']['password'])
    if @new_user.save
      @message = 'Your user has been created'
    else
      @message = @new_user.errors.full_messages
    end
    erb :signup
  end

  get '/users' do
    @users = User.all
    erb :users_index
  end
end
