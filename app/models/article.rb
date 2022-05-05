class Article < ApplicationRecord
  include ImageUploader::Attachment(:image)

  has_many :comments, dependent: :destroy

  belongs_to :user
  belongs_to :category

  validates :title, :body, presence: { message: 'не может быть пустым' }
end
