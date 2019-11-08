class ApplicationController < ActionController::Base
    rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.listings_url, :alert => exception.message
    end
end

