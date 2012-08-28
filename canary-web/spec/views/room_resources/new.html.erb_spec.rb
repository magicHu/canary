require 'spec_helper'

describe "room_resources/new" do
  before(:each) do
    assign(:room_resource, stub_model(RoomResource,
      :room_id => 1,
      :total => 1,
      :price => 1,
      :order => 1
    ).as_new_record)
  end

  it "renders new room_resource form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => room_resources_path, :method => "post" do
      assert_select "input#room_resource_room_id", :name => "room_resource[room_id]"
      assert_select "input#room_resource_total", :name => "room_resource[total]"
      assert_select "input#room_resource_price", :name => "room_resource[price]"
      assert_select "input#room_resource_order", :name => "room_resource[order]"
    end
  end
end
