class Issue < ApplicationRecord
  has_many :attachments, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  
end
