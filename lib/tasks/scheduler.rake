desc "This task is called by the Heroku scheduler add-on"

task send_request_confirmation_email: :environment do
  puts "Checking requests and sending confirmation mail..."
  Request.renew
  puts "Done"
end
