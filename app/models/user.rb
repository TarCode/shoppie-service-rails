class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include ActiveModel::SecurePassword

  field :email, type: String
  field :password, type: String
  field :password_digest, type: String

  validates :email, presence: true
  validates :password, presence: true

  has_secure_password
end
