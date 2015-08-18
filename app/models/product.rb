class Product < ActiveRecord::Base
  PER_PAGE = 5
  attr_accessible :body, :price, :title, :images_attributes

  has_many :images, as: :imageable, dependent: :destroy

  has_many :reviews

  accepts_nested_attributes_for :images, allow_destroy: true

  scope :ordered, order('created_at DESC')
end
