class Request < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, format: { with: /^[\w+\-.]+@[a-zA-Z0-9.]{2,}\.[a-z]{2,4}$/ }
  validates :phone, presence: true, format: { with: /^(0|\+33)[1-9]\d{8}$/ }
  validates :bio, presence: true, length: { minimum: 140 }
  validates :status, presence: true, default: "unconfirmed"
end
