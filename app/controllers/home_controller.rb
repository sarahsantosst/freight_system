class HomeController < ApplicationController
  skip_before_action :authenticate_user! 

  def index
  end

  def search
    @code = params["query"]
    @service_orders = ServiceOrder.where("code LIKE ?", "%#{@code}%")
  end 
end
