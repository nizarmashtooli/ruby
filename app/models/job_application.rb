class JobApplication < ApplicationRecord
  belongs_to :user
  belongs_to :job_post
  attribute :seen, :boolean, default: false
end
