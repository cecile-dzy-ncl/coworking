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
      flash[:success] = "Pour confirmer votre inscription à la liste d'attente, merci de consulter votre boîte mail."
      UserMailer.welcome(@request).deliver_now
      redirect_to root_path
    else
      render :new
      flash[:error] = "Erreur lors de l'enregistrement, merci de recommencer."
    end
  end

  def edit
  end

  def update
  end

  private

  def request_params
    params.require(:request).permit(:name, :email, :phone, :bio, :status)
  end
end
