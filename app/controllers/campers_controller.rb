class CampersController < ApplicationController

    #GET campers
    def index
        campers = Camper.all
        render json: campers 
    end

    #GET specific camper
    def show
        camper = Camper.find_by(id: params[:id])
        if camper
            render json: camper, include: ['activities']
        else
            render json: {error: "Camper not found"}, status: :not_found
        end
    end

    #POST camper
    def create
        camper = Camper.create!(camper_params)
        render json: camper, status: :created
    rescue ActiveRecord::RecordInvalid => invalid
        render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity 
    end

    private

    def camper_params
        params.permit(:name, :age)
    end
end
