class WeightConfigsController < ApplicationController
  def index
    @weight_configs = WeightConfig.all
  end

  def show
    @weight_config = WeightConfig.find(params[:id])
  end

  def new
    @transport_types = TransportType.all.filter { |t| t.active }
    @weight_config = WeightConfig.new
  end

  def create
    @weight_config = WeightConfig.new(weight_config_params)
    if @weight_config.save()
      redirect_to @weight_config, notice: 'Configuração de peso cadastrado com sucesso.'
    else
      flash.now[:alert] = 'Configuração de peso não cadastrado.'
      render 'new'
    end
  end

  private

  def weight_config_params
    weight_config = params
      .require(:weight_config)
      .permit(:minimum_range, :maximum_range, :value, :transport_type_id)
  end
end