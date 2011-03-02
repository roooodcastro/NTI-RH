require "spec_helper"

describe ParticipacaoProjetosController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/participacao_projetos" }.should route_to(:controller => "participacao_projetos", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/participacao_projetos/new" }.should route_to(:controller => "participacao_projetos", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/participacao_projetos/1" }.should route_to(:controller => "participacao_projetos", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/participacao_projetos/1/edit" }.should route_to(:controller => "participacao_projetos", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/participacao_projetos" }.should route_to(:controller => "participacao_projetos", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/participacao_projetos/1" }.should route_to(:controller => "participacao_projetos", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/participacao_projetos/1" }.should route_to(:controller => "participacao_projetos", :action => "destroy", :id => "1")
    end

  end
end
