require 'spec_helper'

describe "comentarios/show.html.erb" do
  before(:each) do
    @comentario = assign(:comentario, stub_model(Comentario,
      :autor_id => 1,
      :texto => "MyText",
      :destinatario_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
