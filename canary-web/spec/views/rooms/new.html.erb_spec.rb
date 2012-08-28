require 'spec_helper'

describe "rooms/new" do
  before(:each) do
    assign(:room, stub_model(Room,
      :name => "MyString",
      :address => "MyString",
      :desc => "MyText",
      :total => 1,
      :price => 1
    ).as_new_record)
  end

  it "renders new room form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => rooms_path, :method => "post" do
      assert_select "input#room_name", :name => "room[name]"
      assert_select "input#room_address", :name => "room[address]"
      assert_select "textarea#room_desc", :name => "room[desc]"
      assert_select "input#room_total", :name => "room[total]"
      assert_select "input#room_price", :name => "room[price]"
    end
  end
end
