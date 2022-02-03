class Telephone < ApplicationRecord
  belongs_to :contact
  validates :number, presence: true, uniqueness: true
  VALID_TYPES = ['home', 'work', 'other']
  validates :kind, presence: true, inclusion: { in: VALID_TYPES}
  validates :main, presence: true
end
