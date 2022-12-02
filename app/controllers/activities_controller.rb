class ActivitiesController < ApplicationController
    #GET all activities
    def index
        activities = Activity.all
        render json: activities 
    end
    # DELETE
    def destroy
        activity = Activity.find_by(id: params[:id])
        if activity
            activity.destroy
        else
            render json: {error: "Activity not found"}, status: :not_found
        end 
    end
end
