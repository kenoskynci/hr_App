class LeaveRecordsController < ApplicationController
  before_filter :authenticate_user!
  
  before_action :set_leave_record, only: [:show, :edit, :update, :destroy]

  # GET /employees/1/leave_records
  # GET /leave_records
  # GET /leave_records.json
  def index
    # For URL like /employees/1/leave_records
    # Get the employee with id=1
    @employee = Employee.find(params[:employee_id])

    # Access all leave_records for that employee
    @leave_records = @employee.leave_records
  end
  
   # GET /employees/1/leave_records/2
   # GET /leave_records/1.json
  def show
    @employee = Employee.find(params[:employee_id])

    # For URL like /employees/1/leave_records/2
    # Find an leave_records in employees 1 that has id=2
    @leave_records = @employee.leave_records.find(params[:id])
  end
  
   # GET /employees/1/leave_records/new
  def new
    @employee = Employee.find(params[:employee_id])

    # Associate a leave_records object with employee 1
    @leave_record = @employee.leave_records.build
  end
  
  # GET /leave_records/new
  # POST /employees/1/leave_records
  def create
    @employee = Employee.find(params[:employee_id])

    # For URL like /employees/1/leave_records
    # Populate an leave_records associate with employee 1 with form data
    # employee will be associated with the leave_records
    @leave_record = @employee.leave_records.build(params.require(:leave_record).permit(:description, :date))
    if @leave_record.save
      # Save the leave_record successfully
      redirect_to employee_leave_record_url(@employee, @leave_record)
    else
      render :action => "new"
    end
  end

  # GET /leave_records/1/edit
  # GET /employees/1eave_records/2/edit
  def edit
    @employee = Employee.find(params[:employee_id])

    # For URL like /employees/1/annuals/2/edit
    # Get annual id=2 for employee 1
    @annual = @employee.annuals.find(params[:id])
  end

  # POST /leave_records
  # POST /leave_records.json
  def create
    @leave_record = LeaveRecord.new(leave_record_params)

    respond_to do |format|
      if @leave_record.save
        format.html { redirect_to @leave_record, notice: 'Leave record was successfully created.' }
        format.json { render :show, status: :created, location: @leave_record }
      else
        format.html { render :new }
        format.json { render json: @leave_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /employees/1/annuals/2/edit
  # PATCH/PUT /leave_records/1.json
  def update
     @employee = Employee.find(params[:employee_id])
     @leave_record= LeaveRecord.find(params[:id])
      if @leave_record.update_attributes(params.require(:leave_record).permit(:description, :date))
         # Save the annual successfully
         redirect_to employee_annual_url(@employee, @annual)
      else
       render :action => "edit"
      end
  end 

  # DELETE /leave_records/1
  # DELETE /leave_records/1.json
  def destroy
    @employee = Employee.find(params[:employee_id])
    @leave_record = LeaveRecord.find(params[:id])
    @leave_record.destroy
   
    respond_to do |format|
      format.html { redirect_to leave_records_url, notice: 'Leave record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_leave_record
      @leave_record = LeaveRecord.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def leave_record_params
      params.require(:leave_record).permit(:start_date, :end_date, :number_Of_days, :leave_type, :employee_id)
    end
end
