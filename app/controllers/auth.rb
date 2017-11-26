class SlowFoodApp
  get '/' do
    @categories = Product::VALID_CATEGORIES
    @products = Product.all
    erb :welcome
  end

  get '/login' do
    erb :login
  end

  get '/logout' do
    session[:user_id] = nil
    flash[:logout] = 'You have been logged out'
    redirect '/'
  end

  post '/login' do
    user = User.find_by(name: params['user']['name'])
    if user.authenticate(params['user']['password'])
      session[:user_id] = user.id
      flash[:login] = "Welcome #{current_user.name}! You are logged in"
      redirect '/'
    else
      flash[:login_error] = 'Incorrect username or password'
      redirect '/login'
    end
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    user_params = params['user']
    new_user = User.new(user_params)
    if new_user.save
      new_user.authenticate(user_params['password'])
      session[:user_id] = new_user.id
      flash[:success] = 'Your user has been created'
      redirect '/'
    else
      flash[:error] = new_user.errors.full_messages.join(",")
      redirect '/signup'
    end
  end

  get '/users' do
    @users = User.all
    erb :users_index
  end
end
