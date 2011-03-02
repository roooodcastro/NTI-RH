require 'spec_helper'

describe "vinculos/show.html.erb" do
  before(:each) do
    @vinculo = assign(:vinculo, stub_model(Vinculo,
      :pessoa_id => 1,
      :salario => 1.5,
      :banco => "Banco",
      :agencia => "Agencia",
      :conta => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1.5/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Banco/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Agencia/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
