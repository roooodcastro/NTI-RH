class VinculosController < ApplicationController
  # GET /vinculos
  # GET /vinculos.xml
  def index
    @vinculos = Vinculo.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @vinculos }
    end
  end

  # GET /vinculos/1
  # GET /vinculos/1.xml
  def show
    @vinculo = Vinculo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @vinculo }
    end
  end

  # GET /vinculos/new
  # GET /vinculos/new.xml
  def new
    @vinculo = Vinculo.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @vinculo }
    end
  end

  # GET /vinculos/1/edit
  def edit
    @vinculo = Vinculo.find(params[:id])
  end

  # POST /vinculos
  # POST /vinculos.xml
  def create
    @vinculo = Vinculo.new(params[:vinculo])

    respond_to do |format|
      if @vinculo.save
        format.html { redirect_to(@vinculo, :notice => 'Vinculo was successfully created.') }
        format.xml  { render :xml => @vinculo, :status => :created, :location => @vinculo }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @vinculo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /vinculos/1
  # PUT /vinculos/1.xml
  def update
    @vinculo = Vinculo.find(params[:id])

    respond_to do |format|
      if @vinculo.update_attributes(params[:vinculo])
        format.html { redirect_to(@vinculo, :notice => 'Vinculo was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @vinculo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /vinculos/1
  # DELETE /vinculos/1.xml
  def destroy
    @vinculo = Vinculo.find(params[:id])
    @vinculo.destroy

    respond_to do |format|
      format.html { redirect_to(vinculos_url) }
      format.xml  { head :ok }
    end
  end
end
