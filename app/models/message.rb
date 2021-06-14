class Message < ApplicationRecord
  belongs_to :user, optional: true
  validates_presence_of :chattext
end
