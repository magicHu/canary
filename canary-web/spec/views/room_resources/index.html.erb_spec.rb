require 'spec_helper'

describe "room_resources/index" do
  before(:each) do
    assign(:room_resources, [
      stub_model(RoomResource,
        :room_id => 1,
        :total => 2,
        :price => 3,
        :order => 4
      ),
      stub_model(RoomResource,
        :room_id => 1,
        :total => 2,
        :price => 3,
        :order => 4
      )
    ])
  end

  it "renders a list of room_resources" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
  end
end
