class TransportTypesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :is_admin?

  def index
    @transport_types = TransportType.all
  end

  def show
    @transport_type = TransportType.find(params[:id])
  end

  def new
    @transport_type = TransportType.new
  end

  def create
    @transport_type = TransportType.new(transport_type_params)
    if @transport_type.save()
      redirect_to transport_types_url, notice: 'Tipo de Transporte cadastrado com sucesso.'
    else
      flash.now[:alert] = 'Tipo de Transporte não cadastrado.'
      render 'new'
    end
  end

  def active
    @transport_type = TransportType.find(params[:id])
    @transport_type.active = true
    @transport_type.save()

    redirect_to transport_types_url
  end

  def disable
    @transport_type = TransportType.find(params[:id])
    @transport_type.active = false
    @transport_type.save()

    redirect_to transport_types_url
  end

  def edit
    @transport_type = TransportType.find(params[:id])
  end

  def update
    @transport_type = TransportType.find(params[:id])
    if @transport_type.update(transport_type_params)
      redirect_to @transport_type, notice: 'Tipo de Transporte atualizado com sucesso.'
    else
      flash.now[:notice] = "Todos os campos são obrigatórios"
      render 'edit'
    end
  end

  private

  def transport_type_params
    transport_type_params = params
      .require(:transport_type)
      .permit(:name, :minimum_distance, :maximum_distance, :minimum_weight, :maximum_weight, :flat_hate)
  end
end