module HumanResources
  class RolesController < ApplicationController
    def new
      @role = HumanResources::Role.new
    end
    def create
      @role = HumanResources::Role.create(role_params)
      if @role.save
        redirect_to human_resources_settings_path, notice: "Role created successfully."
      else
        render :new
      end
    end
    private
    def role_params
      params.require(:human_resources_role).permit(:role)
    end
  end
end
