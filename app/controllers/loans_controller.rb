class LoansController < ApplicationController
  # GET /loans
  # GET /loans.xml
  def index
    @loans = Loan.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @loans }
    end
  end
  
  # GET /loans/new
  # GET /loans/new.xml
  def new
    @loan = Loan.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @loan }
    end
  end

  # POST /loans
  # POST /loans.xml
  def create
    @loan = Loan.new(params[:loan])

    respond_to do |format|
      if @loan.save
        format.html { redirect_to(@loan.loan_detail, :notice => 'Loan was successfully created.') }
        format.xml  { render :xml => @loan, :status => :created, :location => @loan }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @loan.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /loans/1
  # DELETE /loans/1.xml
  def destroy
    @loan = Loan.find(params[:id])
    @loan.destroy

    respond_to do |format|
      format.html { redirect_to(loans_url) }
      format.xml  { head :ok }
    end
  end
end
