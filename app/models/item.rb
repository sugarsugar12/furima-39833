class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  validates :title, presence: true, length: { maximum: 40 }
  validates :explanation, presence: true, length: { maximum: 1000 }
  validates :category_id, presence: true
  validates :quality_id, presence: true
  validates :delivery_charge_id, presence: true
  validates :source_id, presence: true
  validates :number_of_day_id, presence: true
  validates :price, presence: true
  validates :image, presence: true

  with_options presence: true, format: { with: /\A[0-9]+\z/ } do
    validates :price,numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999},
               presence: { message: "can't be blank"}
  end
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :quality
  belongs_to :delivery_charge
  belongs_to :source
  belongs_to :number_of_day

  validates :category_id,:quality_id,:delivery_charge_id,:source_id,:number_of_day_id, numericality: { other_than: 1 , message: "can't be blank"}
end
