require 'spec_helper'

describe "orders/edit" do
  before(:each) do
    @order = assign(:order, stub_model(Order,
      :user_id => 1,
      :room_id => 1,
      :room_num => 1,
      :order_name => "MyString",
      :order_phone => "MyString",
      :status => 1,
      :price => 1
    ))
  end

  it "renders the edit order form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => orders_path(@order), :method => "post" do
      assert_select "input#order_user_id", :name => "order[user_id]"
      assert_select "input#order_room_id", :name => "order[room_id]"
      assert_select "input#order_room_num", :name => "order[room_num]"
      assert_select "input#order_order_name", :name => "order[order_name]"
      assert_select "input#order_order_phone", :name => "order[order_phone]"
      assert_select "input#order_status", :name => "order[status]"
      assert_select "input#order_price", :name => "order[price]"
    end
  end
end
