class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: { in: 4..25 }

  has_many :posts
end
