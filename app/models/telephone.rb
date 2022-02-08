class Telephone < ApplicationRecord
  belongs_to :contact
  validates :number, presence: true, uniqueness: {scope: :contact_id}
  enum :valid_types,  [:home, :work, :other]
  validates :kind, presence: true, inclusion: { in: valid_types }
  validates :main, presence: true, inclusion: {in: [true, false]}, uniqueness: {scope: :contact_id, conditions: -> {where(main: true)}}

end
