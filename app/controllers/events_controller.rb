class EventsController < ApplicationController
  def index
    @events = Event.all
    @guest = Guest.new
    render("events/index.html.erb")
  end

  def show
    @event = Event.find(params[:id])

    render("events/show.html.erb")
  end

  def new
    @event = Event.new

    render("events/new.html.erb")
  end

  def create
    @event = Event.new

    @event.date = params[:date]
    @event.time = params[:time]
    @event.venue_id = params[:venue_id]
    @event.creator_id = params[:creator_id]
    @event.title = params[:title]
    save_status = @event.save

    if save_status == true
      redirect_to("/events/#{@event.id}", :notice => "Event created successfully.")
    else
      render("events/new.html.erb")
    end
  end

  def edit
    @event = Event.find(params[:id])

    render("events/edit.html.erb")
  end

  def update
    @event = Event.find(params[:id])

    @event.date = params[:date]
    @event.time = params[:time]
    @event.venue_id = params[:venue_id]
    @event.creator_id = params[:creator_id]
    @event.title = params[:title]

    save_status = @event.save

    if save_status == true
      redirect_to("/events/#{@event.id}", :notice => "Event updated successfully.")
    else
      render("events/edit.html.erb")
    end
  end

  def destroy
    @event = Event.find(params[:id])

    @event.destroy

    if URI(request.referer).path == "/events/#{@event.id}"
      redirect_to("/", :notice => "Event deleted.")
    else
      redirect_to(:back, :notice => "Event deleted.")
    end
  end
end
