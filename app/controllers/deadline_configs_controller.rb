class DeadlineConfigsController < ApplicationController
  def index
    @deadline_configs = DeadlineConfig.all
  end

  def show
    @deadline_config = DeadlineConfig.find(params[:id])
  end

  def new
    @transport_types = TransportType.all.filter { |t| t.active }
    @deadline_config = DeadlineConfig.new
  end

  def create
    @deadline_config = DeadlineConfig.new(deadline_config_params)
    if @deadline_config.save()
      redirect_to @deadline_config, notice: 'Configuração de prazo cadastrado com sucesso.'
    else
      flash.now[:alert] = 'Configuração de prazo não cadastrado.'
      render 'new'
    end
  end

  private

  def deadline_config_params
    deadline_config = params
      .require(:deadline_config)
      .permit(:minimum_range, :maximum_range, :value, :transport_type_id)
  end
end