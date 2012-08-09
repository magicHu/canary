require 'spec_helper'

describe "banners/new" do
  before(:each) do
    assign(:banner, stub_model(Banner,
      :title => "MyString",
      :desc => "MyString",
      :link => "MyString",
      :link_text => "MyString",
      :is_open => false
    ).as_new_record)
  end

  it "renders new banner form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => banners_path, :method => "post" do
      assert_select "input#banner_title", :name => "banner[title]"
      assert_select "input#banner_desc", :name => "banner[desc]"
      assert_select "input#banner_link", :name => "banner[link]"
      assert_select "input#banner_link_text", :name => "banner[link_text]"
      assert_select "input#banner_is_open", :name => "banner[is_open]"
    end
  end
end
