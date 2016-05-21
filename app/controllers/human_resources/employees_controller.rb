module HumanResources
  class EmployeesController < ApplicationController
    layout "human_resources"
    def index
      @employees = Employee.all
    end

    def new
      @employee = HumanResources::Employee.new
    end

    def create
      @employee = HumanResources::Employee.create(employee_params)
      if @employee.save
        redirect_to human_resources_employee_path(@employee), notice: "Employee registered successfully."
      else
        render :new
      end
    end

    def show
      @user = HumanResources::Employee.find(params[:id])
    end

    def edit
      @employee = HumanResources::Employee.find(params[:id])
    end

    def update
      @employee = HumanResources::Employee.find(params[:id])
      @employee.update(employee_params)
      if @employee.save
        redirect_to human_resources_employee_path(@employee), notice: "Employee updated successfully."
      else
        render :edit
      end
    end

    private
    def employee_params
      params.require(:human_resources_employee).permit(:role_id, :photo, :first_name, :middle_name, :last_name,
                                       :password, :password_confirmation, :email, :mobile_number,
                                       occupation_attributes: [:employer, :employer_address, :position, :contact_number])
    end
  end
end
