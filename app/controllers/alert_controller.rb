class AlertController < ApplicationController
    before_action :authenticate_user!
    def index
        #@alerts = Alert.page(params[:page]).per(20)
    end
end

