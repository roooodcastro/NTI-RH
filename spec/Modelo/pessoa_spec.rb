# To change this template, choose Tools | Templates
# and open the template in the editor.

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Pessoa do
  before(:each) do
    @pessoa = Pessoa.new
  end

  it "should not save without a name" do
    @pessoa.cpf = "12345678901"
    @pessoa.endereco = "test"
    @pessoa.save
    @pessoa.errors.should_not be_empty
  end

  it "should not save without endereco" do
    @pessoa.nome = "test"
    @pessoa.cpf = "12345678901"
    @pessoa.save
    @pessoa.errors.should_not be_empty
  end

  it "should not save without a cpf" do
    @pessoa.nome = "test"
    @pessoa.endereco = "test"
    @pessoa.save
    @pessoa.errors[:cpf].include?("can't be blank").should be_true
  end

  context do
    before (:each) do
      @pessoa.nome = "test"
      @pessoa.endereco = "test"
    end

    it "should not save with small cpf" do
      @pessoa.cpf = "123456789"
      @pessoa.save
      @pessoa.errors[:cpf].include?("is too short (minimum is 11 characters)").should be_true
    end

    it "should not save with big cpf" do
      @pessoa.cpf = "123456789012"
      @pessoa.save
      @pessoa.errors[:cpf].include?("is too long (maximum is 11 characters)").should be_true
    end

    it "should save with right cpf" do
      @pessoa.cpf = "12345678901"
      @pessoa.save
      @pessoa.errors.should be_empty
    end
  end
end
