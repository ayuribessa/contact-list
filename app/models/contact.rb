class Contact < ApplicationRecord
  belongs_to :user
  has_many :telephones, dependent: :destroy
  validates :name, presence: true, length: { maximum: 50 }, uniqueness: {scope: user_id}
end
