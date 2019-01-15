class Request < ApplicationRecord
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
    self.update(status: "confirmed")
  end

  def confirmation_token
    self.confirm_token = SecureRandom.hex if self.confirm_token.blank?
  end
end
