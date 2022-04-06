class User < ApplicationRecord
  include Mongoid::Document

  field :name, type: String
  field :email, type: String
  field :password, type: String

  # VALID_EMAIL_FORMAT = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  # VALID_PASSWORD_FORMAT = /^(?=.*[a-zA-Z])(?=.*[0-9]).{10,}$/
  # has_secure_password
  # validates name, presence: true, length: {minimum: 5, maximum: 128}
  # validates password, presence: true, length: {minimum: 10, maximum: 128}, format: {with: VALID_PASSWORD_FORMAT}
  # validates email, presence: true, length: {maximum: 192}, format: { with: VALID_EMAIL_FORMAT}, uniqueness: {case_sensitive: false}
end
