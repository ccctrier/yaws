class Backend::PlanetsController < ApplicationController
  protect_from_forgery
  load_and_authorize_resource
  layout "backend/bootstrap"
  
  def index
    @backend_planets = Backend::Planet.all
    @backend_planet_entries = Backend::PlanetEntry.all(:limit => 23, :order => "published_at desc")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @backend_planets }
    end
  end

  # GET /backend/planets/1
  # GET /backend/planets/1.json
  def show
    @backend_planet = Backend::Planet.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @backend_planet }
    end
  end

  # GET /backend/planets/new
  # GET /backend/planets/new.json
  def new
    @backend_planet = Backend::Planet.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @backend_planet }
    end
  end

  # GET /backend/planets/1/edit
  def edit
    @backend_planet = Backend::Planet.find(params[:id])
  end

  # POST /backend/planets
  # POST /backend/planets.json
  def create
    @backend_planet = Backend::Planet.new(params[:backend_planet])

    respond_to do |format|
      if @backend_planet.save
        format.html { redirect_to @backend_planet, notice: 'Planet was successfully created.' }
        format.json { render json: @backend_planet, status: :created, location: @backend_planet }
      else
        format.html { render action: "new" }
        format.json { render json: @backend_planet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /backend/planets/1
  # PUT /backend/planets/1.json
  def update
    @backend_planet = Backend::Planet.find(params[:id])

    respond_to do |format|
      if @backend_planet.update_attributes(params[:backend_planet])
        format.html { redirect_to @backend_planet, notice: 'Planet was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @backend_planet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /backend/planets/1
  # DELETE /backend/planets/1.json
  def destroy
    @backend_planet = Backend::Planet.find(params[:id])
    @backend_planet.destroy

    respond_to do |format|
      format.html { redirect_to backend_planets_url }
      format.json { head :no_content }
    end
  end
end
