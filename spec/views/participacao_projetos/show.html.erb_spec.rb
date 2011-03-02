require 'spec_helper'

describe "participacao_projetos/show.html.erb" do
  before(:each) do
    @participacao_projeto = assign(:participacao_projeto, stub_model(ParticipacaoProjeto,
      :vinculo_id => 1,
      :cargo_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
