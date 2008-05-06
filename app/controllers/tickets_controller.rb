class TicketsController < ApplicationController

  def index
    @tickets = Ticket.find(:all)
  end


  def show
    @ticket = Ticket.find(params[:id])
  end

end
