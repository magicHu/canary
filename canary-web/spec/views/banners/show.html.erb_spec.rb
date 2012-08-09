require 'spec_helper'

describe "banners/show" do
  before(:each) do
    @banner = assign(:banner, stub_model(Banner,
      :title => "Title",
      :desc => "Desc",
      :link => "Link",
      :link_text => "Link Text",
      :is_open => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/Desc/)
    rendered.should match(/Link/)
    rendered.should match(/Link Text/)
    rendered.should match(/false/)
  end
end
