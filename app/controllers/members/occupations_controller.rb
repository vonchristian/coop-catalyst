module Members
  class OccupationsController < ApplicationController
    def edit
      @occupation = Members::Occupation.find(params[:id])
    end
    def update
      @occupation = Members::Occupation.find(params[:id])
      @occupation.update(occupation_params)
      if @occupation.save
        redirect_to @occupation.user, notice: "Occupation updated successfully."
      else
        render :edit
      end
    end

    private
    def occupation_params
      params.require(:members_occupation).permit(:position, :employer, :employer_address, :contact_number)
    end
  end
end
