require 'bcrypt'
class User < ApplicationRecord::Base
  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  validates :name, presence: true, length: {minimum: 5, maximum: 128}
  validates :password, presence: true, length: {minimum: 10, maximum: 128}, format: { with: /^(?=.*[a-zA-Z])(?=.*[0-9]).{10,}$/}
  validates :email, presence: true, length: {maximum: 192}, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i}
end
