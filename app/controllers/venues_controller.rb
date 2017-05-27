class VenuesController < ApplicationController
  def index
    @venues = Venue.all

    render("venues/index.html.erb")
  end

  def show
    @venue = Venue.find(params[:id])
    @event = Event.new
    render("venues/show.html.erb")
  end

  def new
    @venue = Venue.new

    render("venues/new.html.erb")
  end

  def create
    @venue = Venue.new

    @venue.name = params[:name]
    @venue.address = params[:address]
    @venue.cuisine = params[:cuisine]
    @venue.average_price = params[:average_price]
    @venue.website = params[:website]

    save_status = @venue.save

    if save_status == true
      redirect_to("/venues/#{@venue.id}", :notice => "Venue created successfully.")
    else
      render("venues/new.html.erb")
    end
  end

  def edit
    @venue = Venue.find(params[:id])

    render("venues/edit.html.erb")
  end

  def update
    @venue = Venue.find(params[:id])

    @venue.name = params[:name]
    @venue.address = params[:address]
    @venue.cuisine = params[:cuisine]
    @venue.average_price = params[:average_price]
    @venue.website = params[:website]

    save_status = @venue.save

    if save_status == true
      redirect_to("/venues/#{@venue.id}", :notice => "Venue updated successfully.")
    else
      render("venues/edit.html.erb")
    end
  end

  def destroy
    @venue = Venue.find(params[:id])

    @venue.destroy

    if URI(request.referer).path == "/venues/#{@venue.id}"
      redirect_to("/", :notice => "Venue deleted.")
    else
      redirect_to(:back, :notice => "Venue deleted.")
    end
  end
end
