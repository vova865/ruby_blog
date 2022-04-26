class Article < ApplicationRecord
  has_many :comments, dependent: :destroy

  validates :title, :body, presence: { message: "не может быть пустым" }
end
