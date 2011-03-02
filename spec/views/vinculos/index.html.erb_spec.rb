require 'spec_helper'

describe "vinculos/index.html.erb" do
  before(:each) do
    assign(:vinculos, [
      stub_model(Vinculo,
        :pessoa_id => 1,
        :salario => 1.5,
        :banco => "Banco",
        :agencia => "Agencia",
        :conta => 1
      ),
      stub_model(Vinculo,
        :pessoa_id => 1,
        :salario => 1.5,
        :banco => "Banco",
        :agencia => "Agencia",
        :conta => 1
      )
    ])
  end

  it "renders a list of vinculos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Banco".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Agencia".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
