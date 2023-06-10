class User < ApplicationRecord
  has_secure_password
  has_many :job_applications
  validates :email, presence: true, uniqueness: true
  attribute :admin, :boolean, default: false
end
