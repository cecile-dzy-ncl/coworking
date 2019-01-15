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
      redirect_to root_path
      flash[:success] = "Pour confirmer votre inscription à la liste d'attente, merci de consulter votre boîte mail."
    else
      render :new
      flash[:error] = "Erreur lors de l'enregistrement, merci de recommencer."
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
      redirect_to root_path
      flash[:success] = "Votre email est bien confirmé, vous êtes sur liste d'attente"
    else
      redirect_to root_path
      flash[:error] = "Désolé, utilisateur non connu"
    end
  end

  private

  def request_params
    params.require(:request).permit(:name, :email, :phone, :bio, :status)
  end
end
