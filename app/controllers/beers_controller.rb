class Api::V1::BeersController < ApplicationController
  before_action :set_beer, only: [:show, :edit, :update, :destroy]

  # all methods return json

  # GET beers and order - save to instance variable
  # turn beers to json
  def index
    @beers = Beer.all.order(brand: :asc)
    render json: @beers
  end

  # GET beers/:id
  # GET beers/:id.json
  def show
    if @beer
      render json: @beer
    else
      render json: @beer.errors
    end
  end

  # GET /beers/1/edit
  def edit
  end

  #POST /beers
  #POST /beers.json
  def create
    @beer = Beer.new(beer_params)

    if @beer.save
      render json: @beer
    else
      render json: @beer.errors
    end
  end

  def update
  end

  def destroy
    @beer.destroy

    render json: { notice: 'Beer was successfully removed.' }
  end

  private
  # find the relevant beer in the database from the id passed from last pages params
  def set_beer
    @beer = Beer.find(params[:id])
  end

  # only let these params through
  def beer_params
    params.permit(:brand, :style, :country, :quantity)
  end
end
