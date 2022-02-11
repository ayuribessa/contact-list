class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }, uniqueness: true
  has_many :contacs, dependent: :destroy
  has_many :telephones

end
