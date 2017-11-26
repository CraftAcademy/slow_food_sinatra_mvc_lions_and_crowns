class SlowFoodApp
  post '/order_create' do
    product = Product.find(params['product_id'])
    if session[:order_id]
      order = Order.find(session[:order_id])
    else
      order = Order.create
      session[:order_id] = order.id
    end
    order_item = OrderItem.create(product: product, order: order)
    flash[:order] = "#{order_item.product.name} was added to your order"
    redirect '/'
  end

  get '/checkout' do
    binding.pry
      @order = order
      erb :checkout
  end
end
