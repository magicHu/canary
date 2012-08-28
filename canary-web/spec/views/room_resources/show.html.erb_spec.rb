require 'spec_helper'

describe "room_resources/show" do
  before(:each) do
    @room_resource = assign(:room_resource, stub_model(RoomResource,
      :room_id => 1,
      :total => 2,
      :price => 3,
      :order => 4
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/4/)
  end
end
