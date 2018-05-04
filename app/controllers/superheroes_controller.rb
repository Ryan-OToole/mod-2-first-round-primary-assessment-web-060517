class SuperheroesController < ApplicationController

before_action :find_superhero, only: [:show]

  def index
    @superheroes = Superhero.all
  end

  def show
    @superhero
  end

  def new
    @superhero = Superhero.new
    @superpower = Superpower.all
  end

  def create
    @superhero = Superhero.create(superhero_params)
      if @superhero.valid?
        redirect_to @superhero
      else
        redirect_to new_superhero_path
      end
  end


private

  def find_superhero
    @superhero = Superhero.find(params[:id])
  end

  def superhero_params
    params.require(:superhero).permit(:name, :super_name, :superpower_id)
  end


end
