class Article < ApplicationRecord
  include ImageUploader::Attachment(:image)
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :comments, dependent: :destroy

  belongs_to :user
  belongs_to :category

  validates :title, presence: true, length: { minimum: 5 }
  validates :body, presence: true, length: { in: 20..1000 }
  validates :views, numericality: { only_integer: true }
end
