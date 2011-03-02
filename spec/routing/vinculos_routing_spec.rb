require "spec_helper"

describe VinculosController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/vinculos" }.should route_to(:controller => "vinculos", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/vinculos/new" }.should route_to(:controller => "vinculos", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/vinculos/1" }.should route_to(:controller => "vinculos", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/vinculos/1/edit" }.should route_to(:controller => "vinculos", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/vinculos" }.should route_to(:controller => "vinculos", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/vinculos/1" }.should route_to(:controller => "vinculos", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/vinculos/1" }.should route_to(:controller => "vinculos", :action => "destroy", :id => "1")
    end

  end
end
