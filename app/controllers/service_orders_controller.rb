class ServiceOrdersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :is_admin?, only: [:new, :create]

  def index
    @service_orders = ServiceOrder.all
  end

  def show
    @service_order = ServiceOrder.find(params[:id])
  end

  def new
    @service_order = ServiceOrder.new
  end

  def create
    @service_order = ServiceOrder.new(service_order_params)

    if @service_order.save()
      redirect_to @service_order, notice: 'Ordem de serviço cadastrada com sucesso.'
    else
      flash.now[:alert] = 'Ordem de serviço não cadastrada.'
      render 'new'
    end
  end

  private

  def service_order_params
    service_order_params = params
      .require(:service_order)
      .permit(:status, :total_distance,
        :product_weight, :product_width, :product_height, 
        :product_depth, :sender_address_zip_code, 
        :sender_address_full_address, :sender_address_city,
        :sender_address_state, :destination_name, :destination_document, 
        :destination_address_zip_code, :destination_address_full_address, :destination_address_city, 
        :destination_address_state)
  end
end