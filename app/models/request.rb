class Request < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-zA-Z0-9.]{2,}\.[a-z]{2,4}\z/ }
  validates :phone, presence: true, format: { with: /\A(0|\+33)[1-9]\d{8}\z/ }
  validates :bio, presence: true, length: { minimum: 140 }
  validates :status, presence: true, default: "unconfirmed"
end
