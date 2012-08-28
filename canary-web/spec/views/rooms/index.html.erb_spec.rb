require 'spec_helper'

describe "rooms/index" do
  before(:each) do
    assign(:rooms, [
      stub_model(Room,
        :name => "Name",
        :address => "Address",
        :desc => "MyText",
        :total => 1,
        :price => 2
      ),
      stub_model(Room,
        :name => "Name",
        :address => "Address",
        :desc => "MyText",
        :total => 1,
        :price => 2
      )
    ])
  end

  it "renders a list of rooms" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
