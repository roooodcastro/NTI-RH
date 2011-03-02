require 'spec_helper'

describe "participacao_projetos/new.html.erb" do
  before(:each) do
    assign(:participacao_projeto, stub_model(ParticipacaoProjeto,
      :vinculo_id => 1,
      :cargo_id => 1
    ).as_new_record)
  end

  it "renders new participacao_projeto form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => participacao_projetos_path, :method => "post" do
      assert_select "input#participacao_projeto_vinculo_id", :name => "participacao_projeto[vinculo_id]"
      assert_select "input#participacao_projeto_cargo_id", :name => "participacao_projeto[cargo_id]"
    end
  end
end
