class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 100 }
  validates :body, presence: true, length: { minimum: 10 }
end