class Telephone < ApplicationRecord
  belongs_to :contact
  validates :number, presence: true, uniqueness: {scope: :contact_id}
  validates :kind, presence: true, inclusion: ['home','work', 'other']
  validates :main, inclusion:{ in: [true, false] }, uniqueness: {conditions: -> {where(main: true)}}
  before_validation :turn_old_main_to_false

  private 
  def turn_old_main_to_false
    return unless :main?
    self.main = false if :main?
  end
  
end
