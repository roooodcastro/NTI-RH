require 'spec_helper'

describe "vinculos/new.html.erb" do
  before(:each) do
    assign(:vinculo, stub_model(Vinculo,
      :pessoa_id => 1,
      :salario => 1.5,
      :banco => "MyString",
      :agencia => "MyString",
      :conta => 1
    ).as_new_record)
  end

  it "renders new vinculo form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => vinculos_path, :method => "post" do
      assert_select "input#vinculo_pessoa_id", :name => "vinculo[pessoa_id]"
      assert_select "input#vinculo_salario", :name => "vinculo[salario]"
      assert_select "input#vinculo_banco", :name => "vinculo[banco]"
      assert_select "input#vinculo_agencia", :name => "vinculo[agencia]"
      assert_select "input#vinculo_conta", :name => "vinculo[conta]"
    end
  end
end
