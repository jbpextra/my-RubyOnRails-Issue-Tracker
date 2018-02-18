class Comment < ApplicationRecord
  belongs_to :issue
  belongs_to :user, dependent: :destroy
#  has_one :attachment, dependent: :destroy
end
