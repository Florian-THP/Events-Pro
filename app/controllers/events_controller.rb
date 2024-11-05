class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create] # Assurer que l'utilisateur est connecté

  def index
    @events = Event.all
  end

  def new
    @event = Event.new 
  end

  def show
    @event = Event.find(params[:id]) 
  end

  def create
    @event = current_user.events.build(event_params)

    if @event.save
      redirect_to event_path(@event), notice: 'Lévénement a été créé avec succès.'
    else
      render :new 
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :start_date, :duration, :price, :location) # Permets les paramètres nécessaires
  end
end
