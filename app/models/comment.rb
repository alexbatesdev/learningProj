class Comment < ApplicationRecord
  belongs_to :post

  validates :commenter, presence: true, length: { maximum: 32 }
  validates :body, presence: true
end
