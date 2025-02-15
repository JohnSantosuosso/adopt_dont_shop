class ApplicationsController < ApplicationController 
  def new
    
  end

  def create
    application = Application.new(application_params)
    
    if application.save
      redirect_to "/applications/#{application.id}"
    else
      redirect_to '/applications/new'
      flash[:alert] = "Error: #{error_message(application.errors)}"
    end
  end
  
  def update
    application = Application.find(params[:id])
    application.update!(description: params[:description], app_status: "Pending")
    redirect_to "/applications/#{application.id}"
  end
  def show
    @application = Application.find(params[:id])
    if params[:search_name].present?
      @located_pets = Pet.search(params[:search_name])
    end
  end

  private
  def application_params
    params.permit(
      :name, 
      :street_address, 
      :city,
      :state,
      :zipcode,
      :description
    )
  end

end