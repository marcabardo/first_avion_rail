class Article < ApplicationRecord
  has_many :comments
  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 5 }
end
