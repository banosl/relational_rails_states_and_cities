class StatesController < ApplicationController
  def index
    @states = State.all.order(created_at: :desc)
  end

  def show
    @state = State.find(params[:id])
  end

  def new
  end

  def create
    state = State.new(state_params)
    state.save

    redirect_to '/states'
  end

  def edit
    @state = State.find(params[:id])
  end

  def update
    state = State.find(params[:id])
    state.update(state_params)
    state.save

    redirect_to "/states/#{state.id}"
  end

  def destroy
    state = State.find(params[:id])
    state.cities.map do |city|
      city.destroy
    end
    State.destroy(params[:id])

    redirect_to "/states"
  end

private
  def state_params
    params.permit(:name, :population, :gdp, :size, :coastal)
  end
end