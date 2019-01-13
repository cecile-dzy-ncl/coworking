class RequestsController < ApplicationController

  def index
    @requests = Request.all
  end

  def new
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)
    if @request.save
      redirect_to "/"
      flash[:success] = "Pour confirmer votre inscription à la liste d'attente, merci de consulter votre boîte mail."
    else
      flash[:error] = "Erreur lors de l'enregistrement, merci de recommencer."
      render :new
    end
  end

  def edit
  end

  private

  def request_params
    params.require(:request).permit(:name, :email, :phone, :bio, :status)
  end
end
