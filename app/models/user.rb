class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true, length: {minimum: 5, maximum: 128}
  validates :password, presence: true, length: {minimum: 10, maximum: 128}, format: { with: /^(?=.*[a-zA-Z])(?=.*[0-9]).{10,}$/}
  validates :email, presence: true, length: {maximum: 192}, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i}
end
