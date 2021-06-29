class PrivateMessage < ApplicationRecord
  belongs_to :user

  validates_presence_of :directmessage
end
