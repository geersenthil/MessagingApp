class Message < ApplicationRecord
  belongs_to :room, inverse_of: :messages
  belongs_to :user, optional: true
  validates_presence_of :chattext
end
