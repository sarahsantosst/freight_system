class ServiceOrdersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :is_admin?, only: [:new, :create]

  def index
    @all_service_orders = ServiceOrder.all
    @pending_service_orders = @all_service_orders.filter { |so| so.status == 'pending' || so.status == 'started' }
  end

  def show
    @service_order = ServiceOrder.find(params[:id])

    @transport_types = TransportType.all.filter { |t| 
      t.active && t.minimum_distance <= @service_order.total_distance && t.maximum_distance >= @service_order.total_distance
    }
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

  def init
    @service_order = ServiceOrder.find(params[:service_order_id])

    @transport_type = TransportType.find(params[:transport_type_id])
    @vehicle = Vehicle.all.filter { |t| t.status == 'active' && t.transport_type_id == @transport_type.id }.first
    if @vehicle.present?
      @vehicle.status = 'on_delivery'
      @vehicle.save()
    else
      return redirect_to @service_order, alert: 'Nenhum veículo disponível.'
    end
    
    @service_order.status = 'started'
    @service_order.total_price = @service_order.calc_total_price(@transport_type)
    @service_order.total_deadline = @service_order.calc_total_deadline(@transport_type)
    @service_order.vehicle_id = @vehicle.id
    if @service_order.save()
      redirect_to @service_order, notice: 'Ordem de serviço iniciada com sucesso.'
    else
      flash.now[:alert] = 'Ordem de serviço não iniciada.'
      render @service_order
    end
  end

  def finish
    @service_order = ServiceOrder.find(params[:id])

    @vehicle = Vehicle.find(@service_order.vehicle_id)
    if @vehicle.present?
      @vehicle.status = 'active'
      @vehicle.save()
    else
      return redirect_to @service_order, alert: 'Nenhum veículo encontrado nessa ordem de serviço.'
    end

    now = Time.zone.now
    @service_order.delivered_date = now
    @service_order.vehicle_id = nil

   if @service_order.updated_at + @service_order.total_deadline.to_i.hours >= now
    @service_order.status = 'closed_on_deadline'
   else
    @service_order.status = 'closed_late'
    @service_order.reason = 'Atraso'
   end

   if @service_order.save()
      redirect_to @service_order, notice: 'Ordem de serviço finalizada com sucesso.'
    else
      flash.now[:alert] = 'Ordem de serviço não finalizada.'
      render @service_order
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