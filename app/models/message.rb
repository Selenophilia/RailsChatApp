class Message < ApplicationRecord
    belongs_to :user
    belongs_to :chatroom, inverse_of: :messages
    validates :message_body, presence: true
end
