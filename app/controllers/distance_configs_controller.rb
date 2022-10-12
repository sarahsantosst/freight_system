class DistanceConfigsController < ApplicationController
  def index
    @distance_configs = DistanceConfig.all
  end

  def show
    @distance_config = DistanceConfig.find(params[:id])
  end

  def new
    @transport_types = TransportType.all.filter { |t| t.active }
    @distance_config = DistanceConfig.new
  end

  def create
    @distance_config = DistanceConfig.new(distance_config_params)
    if @distance_config.save()
      redirect_to @distance_config, notice: 'Configuração de distância cadastrado com sucesso.'
    else
      flash.now[:alert] = 'Configuração de distância não cadastrado.'
      render 'new'
    end
  end

  private

  def distance_config_params
    distance_config = params
      .require(:distance_config)
      .permit(:minimum_range, :maximum_range, :value, :transport_type_id)
  end
end