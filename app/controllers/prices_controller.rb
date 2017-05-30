class PricesController < ApplicationController
  def index
    @prices = Price.all

    render("prices/index.html.erb")
  end

  def show
    @price = Price.find(params[:id])
  
    render("prices/show.html.erb")
  end

  def new
    @price = Price.new

    render("prices/new.html.erb")
  end

  def create
    @price = Price.new

    @price.range = params[:range]

    save_status = @price.save

    if save_status == true
      redirect_to("/prices/#{@price.id}", :notice => "Price created successfully.")
    else
      render("prices/new.html.erb")
    end
  end

  def edit
    @price = Price.find(params[:id])

    render("prices/edit.html.erb")
  end

  def update
    @price = Price.find(params[:id])

    @price.range = params[:range]

    save_status = @price.save

    if save_status == true
      redirect_to("/prices/#{@price.id}", :notice => "Price updated successfully.")
    else
      render("prices/edit.html.erb")
    end
  end

  def destroy
    @price = Price.find(params[:id])

    @price.destroy

    if URI(request.referer).path == "/prices/#{@price.id}"
      redirect_to("/", :notice => "Price deleted.")
    else
      redirect_to(:back, :notice => "Price deleted.")
    end
  end
end
