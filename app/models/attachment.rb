class Attachment < ApplicationRecord
 # belongs_to :comment
  belongs_to :issue
  mount_uploader :content, AttachmentUploader # Tells rails to use this uploader for this model.

#  validates :comment_id, presence: true
  validates :issue_id, presence: true
  default_scope -> { order(created_at: :desc) }
end
