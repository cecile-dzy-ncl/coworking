class Request < ApplicationRecord
  before_create :confirmation_token

  validates :name, presence: true
  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-zA-Z0-9.]{2,}\.[a-z]{2,4}\z/ }
  validates :phone, presence: true, format: { with: /\A(0|\+33)[1-9]\d{8}\z/ }
  validates :bio, presence: true, length: { minimum: 140 }
  # validates :status, presence: true, default: "unconfirmed"

  def self.unconfirmed
    Request.where(status: "unconfirmed")
  end

  def self.confirmed
    Request.where(status: "confirmed")
  end

  def self.accepted
    Request.where(status: "accepted")
  end

  def self.expired
    Request.where(status: "expired")
  end

  def accept!
    self.update(status: "accepted")
  end

  def email_confirmed!
    self.email_confirmed = true
    self.confirm_token = nil
    self.update(status: "confirmed")
  end

  def self.renew
    requests = Request.confirmed
    requests.each do |request|
      # calcul en minutes pour envoi mail relance apres 10 minutes
      if ((Time.now - request.updated_at) / 3600) > 10
        UserMailer.confirmation(request).deliver_now
        request.status = "expired"
      end
    end
  end

  def request_confirmed!
    self.confirm_token = nil
    self.update(status: "confirmed")
  end

  private

  def confirmation_token
    if self.confirm_token.blank?
      self.confirm_token = SecureRandom.urlsafe_base64.to_s
    end
  end
end

# calcul en jour
# if ((Time.now - request.updated_at) / 3600 / 24) > 91
