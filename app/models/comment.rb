class Comment < ApplicationRecord
  belongs_to :user, inverse_of: :comments
  belongs_to :project, inverse_of: :comments

  before_validation :update_conversation_history

	private
		def update_conversation_history
			begin
		 		project.histories.create!(description: "User #{user.name} commented on the project #{project.title}")
		 rescue StandardError => e
		 	Rails.logger.error "Error witin Comment model at the time of update_conversation_history #{e.message}"
		 end 
		end
end
