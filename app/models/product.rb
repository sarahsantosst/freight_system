class Product < ApplicationRecord
  validates :code, :weight, :height, :depth, presence: true
end
