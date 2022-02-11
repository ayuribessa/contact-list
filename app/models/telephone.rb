class Telephone < ApplicationRecord
  belongs_to :contact
  validates :number, presence: true, uniqueness: {scope: :contact_id}
  validates :kind, presence: true, inclusion: ['home','work', 'other']
  validates :main, inclusion:{ in: [true, false] }, uniqueness: {conditions: -> {where(main: true)}}

end
