require 'spec_helper'

describe "orders/index" do
  before(:each) do
    assign(:orders, [
      stub_model(Order,
        :user_id => 1,
        :room_id => 2,
        :room_num => 3,
        :order_name => "Order Name",
        :order_phone => "Order Phone",
        :status => 4,
        :price => 5
      ),
      stub_model(Order,
        :user_id => 1,
        :room_id => 2,
        :room_num => 3,
        :order_name => "Order Name",
        :order_phone => "Order Phone",
        :status => 4,
        :price => 5
      )
    ])
  end

  it "renders a list of orders" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Order Name".to_s, :count => 2
    assert_select "tr>td", :text => "Order Phone".to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
  end
end
