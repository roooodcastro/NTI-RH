require 'spec_helper'

describe "comentarios/edit.html.erb" do
  before(:each) do
    @comentario = assign(:comentario, stub_model(Comentario,
      :autor_id => 1,
      :texto => "MyText",
      :destinatario_id => 1
    ))
  end

  it "renders the edit comentario form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => comentarios_path(@comentario), :method => "post" do
      assert_select "input#comentario_autor_id", :name => "comentario[autor_id]"
      assert_select "textarea#comentario_texto", :name => "comentario[texto]"
      assert_select "input#comentario_destinatario_id", :name => "comentario[destinatario_id]"
    end
  end
end
