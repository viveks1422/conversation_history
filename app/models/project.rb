class Project < ApplicationRecord
	has_many :comments, dependent: :destroy, inverse_of: :project
	has_many :histories, as: :conversationable, dependent: :destroy
	belongs_to :status, inverse_of: :projects

	before_validation :update_conversation_history

	private
		def update_conversation_history
			begin
		 		return if id.blank?
		 		histories.create!(description: "Status has been changed for the project #{title} to #{status.name}") if status_changed?
		 rescue StandardError => e
		 	Rails.logger.error "Error witin Project model at the time of update_conversation_history #{e.message}"
		 end 
		end
end
