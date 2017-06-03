class GuestsController < ApplicationController
  def index
    @guests = Guest.all

    render("guests/index.html.erb")
  end

  def show
    @guest = Guest.find(params[:id])

    render("guests/show.html.erb")
  end

  def new
    @guest = Guest.new

    render("guests/new.html.erb")
  end

  def create
    @guest = Guest.new

    @guest.user_id = params[:user_id]
    @guest.event_id = params[:event_id]

    save_status = @guest.save

    if save_status == true
      redirect_to("/events", :notice => "Attending")
    else
      render("guests/new.html.erb")
    end
  end

  def edit
    @guest = Guest.find(params[:id])

    render("guests/edit.html.erb")
  end

  def update
    @guest = Guest.find(params[:id])

    @guest.user_id = params[:user_id]
    @guest.event_id = params[:event_id]

    save_status = @guest.save

    if save_status == true
      redirect_to("/guests/#{@guest.id}", :notice => "Guest updated successfully.")
    else
      render("guests/edit.html.erb")
    end
  end

  def destroy
    @guest = Guest.find(params[:id])

    @guest.destroy

    if URI(request.referer).path == "/guests/#{@guest.id}"
      redirect_to("/", :notice => "Not Attending")
    else
      redirect_to(:back, :notice => "Not Attending")
    end
  end
end
