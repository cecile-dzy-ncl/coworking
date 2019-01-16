class CheckExpirationJob < ApplicationJob
  queue_as :default

  def perform
    requests = Request.confirmed
    requests.each do |request|
      # calcul en minutes pour envoi mail relance apres 10 minutes
      if ((Time.now - request.updated_at) / 3600) > 10
        UserMailer.confirmation(request).deliver_now
        request.update(status: "expired")
      end
    end
  end
end
