class FieldPrototypesController < ApplicationController
  # GET /field_prototypes
  # GET /field_prototypes.xml
  def index
    @field_prototypes = FieldPrototype.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @field_prototypes }
    end
  end

  # GET /field_prototypes/1
  # GET /field_prototypes/1.xml
  def show
    @field_prototype = FieldPrototype.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @field_prototype }
    end
  end

  # GET /field_prototypes/new
  # GET /field_prototypes/new.xml
  def new
    @field_prototypes = FieldPrototype.all
    @field_prototype = FieldPrototype.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @field_prototype }
    end
  end

  # GET /field_prototypes/1/edit
  def edit
    @field_prototypes = FieldPrototype.all
    @field_prototype = FieldPrototype.find(params[:id])
  end

  # POST /field_prototypes
  # POST /field_prototypes.xml
  def create
    @field_prototype = FieldPrototype.new(params[:field_prototype])
    setup_additional_fields
    respond_to do |format|
      if @field_prototype.save
        format.html { redirect_to(@field_prototype, :notice => 'Field prototype was successfully created.') }
        format.xml  { render :xml => @field_prototype, :status => :created, :location => @field_prototype }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @field_prototype.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /field_prototypes/1
  # PUT /field_prototypes/1.xml
  def update
    @field_prototype = FieldPrototype.find(params[:id])
    setup_additional_fields
    respond_to do |format|
      if @field_prototype.update_attributes(params[:field_prototype])
        format.html { redirect_to(@field_prototype, :notice => 'Field prototype was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @field_prototype.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /field_prototypes/1
  # DELETE /field_prototypes/1.xml
  def destroy
    @field_prototype = FieldPrototype.find(params[:id])
    @field_prototype.destroy

    respond_to do |format|
      format.html { redirect_to(field_prototypes_url) }
      format.xml  { head :ok }
    end
  end

private

  def setup_additional_fields
    if @field_prototype.field_type == "DropDown"
      dd_values = []
      dd_values << params[:dd1] if params[:dd1]
      dd_values << params[:dd2] if params[:dd2]
      dd_values << params[:dd3] if params[:dd3]
      params.delete :dd1
      params.delete :dd2
      params.delete :dd3
      @field_prototype[:dd_values] = dd_values
    elsif @field_prototype.field_type == "Calculation"
      calc_values = []
      calc_values << params[:op1] if params[:op1]
      calc_values << params[:op2] if params[:op2]
      calc_values << params[:op3] if params[:op3]
      params.delete :op1
      params.delete :op2
      params.delete :op3
      @field_prototype[:calc_values] = calc_values
    end
  end
end
