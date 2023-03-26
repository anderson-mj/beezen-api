class AlertsController < ApplicationController
    before_action :authenticate_user!
    def index
        filter = params[:type] || ["portal_opened", "portal_closed"]
        @alerts = Alert.where(type: filter).order(created_at: :desc)
        @paginated_alerts = @alerts.page(params[:page]).per(9)
    end
end

