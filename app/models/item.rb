class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :condition
  belongs_to :category
  belongs_to :postage
  belongs_to :sipping_area
  belongs_to :sipping_date
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :text
    validates :price
  end

  with_options numericality: { other_than: 1 } do
    validates :condition_id
    validates :category_id
    validates :postage_id
    validates :sipping_area_id
    validates :sipping_date_id
  end

  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
