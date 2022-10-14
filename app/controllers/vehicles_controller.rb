class VehiclesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :is_admin?, only: [:new, :create, :active, :disable, :edit, :update]

  def index
    @vehicles = Vehicle.all
  end

  def show
    @vehicle = Vehicle.find(params[:id])
  end

  def new
    @transport_types = TransportType.all.filter { |t| t.active }
    @vehicle = Vehicle.new
  end

  def create
    @vehicle = Vehicle.new(vehicle_params)
    if @vehicle.save()
      redirect_to @vehicle, notice: 'Veículo cadastrado com sucesso.'
    else
      flash.now[:alert] = 'Veículo não cadastrado.'
      render 'new'
    end
  end

  def active
    @vehicle = Vehicle.find(params[:id])
    @vehicle.active = true
    if @vehicle.save()
      redirect_to vehicles_url, notice: 'Veículo habilitado com sucesso.'
    else
      flash.now[:alert] = 'Erro ao habilitar.'
      render 'new'
    end
  end

  def disable
    @vehicle = Vehicle.find(params[:id])
    @vehicle.active = false
    if @vehicle.save()
      redirect_to vehicles_url, notice: 'Veículo desabilitado com sucesso.'
    else
      flash.now[:alert] = 'Erro ao desabilitado.'
      render 'new'
    end
  end

  def edit
    @transport_types = TransportType.all.filter { |t| t.active }
    @vehicle = Vehicle.find(params[:id])
  end

  def update
    @vehicle = Vehicle.find(params[:id])
    if @vehicle.update(vehicle_params)
      redirect_to @vehicle, notice: 'Veículo atualizado com sucesso.'
    else
      flash.now[:notice] = "Todos os campos são obrigatórios"
      render 'edit'
    end
  end

  def search
    @license_plate = params["query"]
    @vehicles = Vehicle.where("license_plate LIKE ?", "%#{@license_plate}%")
  end 

  private

  def vehicle_params
    vehicle_params = params
      .require(:vehicle)
      .permit(:license_plate, :brand, :model, :manufacture_year, :maximum_load_capacity, :transport_type_id)
  end
end