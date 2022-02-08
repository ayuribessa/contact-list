class Telephone < ApplicationRecord
  belongs_to :contact
  validates :number, presence: true, uniqueness: {scope: :contact_id}
  VALID_TYPES = ['home', 'work', 'other']
  validates :kind, presence: true, inclusion: { in: VALID_TYPES}
  validates :main, presence: true, inclusion: {in: [true, false]}, uniqueness: {scope: :contact_id, conditions: -> {where(main: true)}}

end
