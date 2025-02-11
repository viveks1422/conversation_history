class Status < ApplicationRecord
  has_many :projects, dependent: :destroy, inverse_of: :status
  STATUS_TYPES = [ "New", "Pending", "Active" ]
end
