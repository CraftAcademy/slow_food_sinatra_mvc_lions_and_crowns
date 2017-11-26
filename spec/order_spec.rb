require 'spec_helper'

describe Order do

  describe 'Database' do
    it {is_expected.to have_db_column :id}
    it {is_expected.to have_db_column :created_at}
    it {is_expected.to have_db_column :updated_at}
    it {is_expected.to have_db_column :status}

    it {is_expected.to have_many :order_items}
  end

  describe 'validations' do
    it {is_expected.to validate_inclusion_of(:status).in_array(Order::VALID_STATUS)}
  end



    describe '#total' do
      let!(:product_1) {Product.create(name: 'Pizza',
      price: 105,
      category: 'Main course')}

      let!(:product_2) {Product.create(name: 'Nachos',
        price: 60,
        category: 'Main course')}

      let!(:item_1) {OrderItem.create(product: product_1, order: subject)}
      let!(:item_2) {OrderItem.create(product: product_2, order: subject)}

      it 'calculates a total for all items' do
        expect(subject.total).to eq 165
      end

    end

end
