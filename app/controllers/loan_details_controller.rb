class LoanDetailsController < ApplicationController
  # GET /loan_details
  # GET /loan_details.xml
  def index
    @loan_details = LoanDetail.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @loan_details }
    end
  end

  # GET /loan_details/1
  # GET /loan_details/1.xml
  def show
    @loan_detail = LoanDetail.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @loan_detail }
    end
  end

  # GET /loan_details/1/edit
  def edit
    @loan_detail = LoanDetail.find(params[:id])
  end

  # PUT /loan_details/1
  # PUT /loan_details/1.xml
  def update
    @loan_detail = LoanDetail.find(params[:id])

    respond_to do |format|
      if @loan_detail.update_attributes(params[:loan_detail])
        format.html { redirect_to(@loan_detail, :notice => 'Loan detail was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @loan_detail.errors, :status => :unprocessable_entity }
      end
    end
  end
  
end
