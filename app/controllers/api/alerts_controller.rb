class Api::AlertsController < Api::BaseController
    def index
        render json: Alert.all
    end

    def create
        alert = Alert.new(alert_params)
        if alert.save
            render json: alert
        else
            render json: { errors: alert.errors.full_messages }, status: :unprocessable_entity
        end
    end

    private

    def alert_params
        params.permit(:type, :description, :origin, :tag => [])
    end
end
