class MyeventsController < ApplicationController
  def index
    @my_events= Event.where({:creator_id => current_user.id})

    render("my_events/index.html.erb")
end
end
