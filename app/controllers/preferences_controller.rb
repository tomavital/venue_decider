class PreferencesController < ApplicationController
  def index
    @preferences = Preference.all

    render("preferences/index.html.erb")
  end

  def show
    @preference = Preference.find(params[:id])

    render("preferences/show.html.erb")
  end

  def new
    @preference = Preference.new

    render("preferences/new.html.erb")
  end

  def create
    @preference = Preference.new

    @preference.user_id = params[:user_id]
    @preference.cuisine_id = params[:cuisine_id]

    save_status = @preference.save

    if save_status == true
      redirect_to("/preferences/#{@preference.id}", :notice => "Preference created successfully.")
    else
      render("preferences/new.html.erb")
    end
  end

  def edit
    @preference = Preference.find(params[:id])

    render("preferences/edit.html.erb")
  end

  def update
    @preference = Preference.find(params[:id])

    @preference.user_id = params[:user_id]
    @preference.cuisine_id = params[:cuisine_id]

    save_status = @preference.save

    if save_status == true
      redirect_to("/preferences/#{@preference.id}", :notice => "Preference updated successfully.")
    else
      render("preferences/edit.html.erb")
    end
  end

  def destroy
    @preference = Preference.find(params[:id])

    @preference.destroy

    if URI(request.referer).path == "/preferences/#{@preference.id}"
      redirect_to("/", :notice => "Preference deleted.")
    else
      redirect_to(:back, :notice => "Preference deleted.")
    end
  end
end
