class Telephone < ApplicationRecord
  belongs_to :contact
  validates :number, presence: true, uniqueness: { scope: :contact_id }
  validates :kind, presence: true, inclusion: %w[home work other]
  validates :main, inclusion: { in: [true, false] }, uniqueness: { scope: :contact_id, conditions: lambda {
                                                                                                     where(main: true)
                                                                                                   } }
end
