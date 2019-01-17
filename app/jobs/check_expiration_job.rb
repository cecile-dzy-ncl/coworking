class CheckExpirationJob < ApplicationJob
  queue_as :default

  def perform
    puts "I'm cheking for confirmed request older than 10 minutes and sending mail"
    requests = Request.confirmed
    requests.each do |request|
      # calcul en minutes pour envoi mail relance apres 10 minutes
      if ((Time.now - request.updated_at) / 3600) > 10
        UserMailer.confirmation(request).deliver_now
        request.update(status: "expired")
        puts "ok i send an email"
      else
        puts "no request older than 10 minutes"
      end
    end
  end
end
