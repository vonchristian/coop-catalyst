class RolesController < ApplicationController
  def new
    @role = Role.new
  end
  def create
    @role = Role.create(role_params)
    if @role.save
      redirect_to roles_path, notice: "Role created successfully."
    else
      render :new
    end
  end
  private
  def role_params
    params.require(:role).permit(:role)
  end
end
