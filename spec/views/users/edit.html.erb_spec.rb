require 'spec_helper'

describe "users/edit.html.erb" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :nome => "MyString",
      :email => "MyString",
      :password => ""
    ))
  end

  it "renders the edit user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => users_path(@user), :method => "post" do
      assert_select "input#user_nome", :name => "user[nome]"
      assert_select "input#user_email", :name => "user[email]"
      assert_select "input#user_password", :name => "user[password]"
    end
  end
end
