require 'spec_helper'

describe "banners/index" do
  before(:each) do
    assign(:banners, [
      stub_model(Banner,
        :title => "Title",
        :desc => "Desc",
        :link => "Link",
        :link_text => "Link Text",
        :is_open => false
      ),
      stub_model(Banner,
        :title => "Title",
        :desc => "Desc",
        :link => "Link",
        :link_text => "Link Text",
        :is_open => false
      )
    ])
  end

  it "renders a list of banners" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Desc".to_s, :count => 2
    assert_select "tr>td", :text => "Link".to_s, :count => 2
    assert_select "tr>td", :text => "Link Text".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
