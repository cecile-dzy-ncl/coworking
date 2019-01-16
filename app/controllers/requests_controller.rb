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
      UserMailer.welcome(@request).deliver_now
      flash[:notice] = "Pour confirmer votre inscription à la liste d'attente, merci de consulter votre boîte mail."
      redirect_to root_path
    else
      flash[:alert] = "Erreur lors de l'enregistrement, merci de recommencer."
      render :new
    end
  end

  def edit
  end

  def update
  end

  def confirm_email
    request = Request.find_by_confirm_token(params[:id])
    if request
      request.email_confirmed!
      flash[:notice] = "Votre email est bien confirmé, vous êtes sur liste d'attente."
      redirect_to root_path
    else
      flash[:alert] = "Désolé, utilisateur non connu."
      redirect_to root_path
    end
  end

  def confirm_request
    request = Request.find_by_confirm_token(params[:id])
    if request
      request.request_confirmed!
      flash[:notice] = "Votre demande est bien renouvellée."
      redirect_to root_path
    else
      flash[:alert] = "Désolé, utilisateur non connu."
      redirect_to root_path
    end
  end

  private

  def request_params
    params.require(:request).permit(:name, :email, :phone, :bio, :status)
  end
end
