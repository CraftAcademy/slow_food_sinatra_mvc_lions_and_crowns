Given(/^I click "([^"]*)" on "([^"]*)"$/) do |element, product_name|
  @product = Product.find_by(name: product_name)
  within("#product-#{@product.id}") do
    click_link_or_button element
  end
end

Given(/^there is an order with order item "([^"]*)"$/) do |item|
  steps %Q{
       And I click "Order" on "#{item}"
       Then there should be an order created for me
  }
end

Then(/^there should be an order created for me$/) do
  @order = Order.last
  expect(@order).to_not be nil
end

Then(/^the order should contain "([^"]*)"$/) do |product_name|
  product = @product || Product.find_by(name: product_name)
  item = @order.order_items.detect {|item| item.product == product}
  expect(item.product).to eq product
end

Then(/^I should see "([^"]*)"$/) do |text|
  expect(page).to have_content text
end
