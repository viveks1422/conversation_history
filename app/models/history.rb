class History < ApplicationRecord
  belongs_to :conversationable, polymorphic: true
end
