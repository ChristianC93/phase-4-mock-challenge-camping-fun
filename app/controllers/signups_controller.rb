class SignupsController < ApplicationController

    #POST signup
    def create
        signup = Signup.create!(signup_params)
        render json: signup.activity, status: :created
    rescue ActiveRecord::RecordInvalid => invalid
        render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end

    private

    def signup_params
        params.permit(:activity_id, :camper_id, :time)
    end
end
