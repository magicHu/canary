require 'spec_helper'

describe "orders/show" do
  before(:each) do
    @order = assign(:order, stub_model(Order,
      :user_id => 1,
      :room_id => 2,
      :room_num => 3,
      :order_name => "Order Name",
      :order_phone => "Order Phone",
      :status => 4,
      :price => 5
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/Order Name/)
    rendered.should match(/Order Phone/)
    rendered.should match(/4/)
    rendered.should match(/5/)
  end
end
