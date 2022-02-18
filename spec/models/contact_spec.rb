require 'rails_helper'

RSpec.describe Contact, type: :model do
  fixtures :users, :contacts
  it 'is valid with user_id, name and birthday ' do
    Contact.create(name: 'Beltrano', birthday: '09/02/1994', user_id: 1)
    expect(Contact.count).to eq 2
  end

  it 'is not valid without a name' do
    contact = Contact.create(name: nil, birthday: '09/03/1995', user_id: 2)
    contact.valid?
    expect(contact.errors[:name]).to include("can't be blank")
  end

  it 'is valid with the same name on different user_id' do
    contact = Contact.create(name: 'Fulano', birthday: '09/03/1995', user_id: 2)
    expect(contact).to be_valid
  end

  it 'is not valid with the same name on the same user_id' do
    contact = Contact.create(name: 'Fulano', birthday: '09/03/1995', user_id: 1)
    contact.valid?
    expect(contact.errors[:name]).to include('has already been taken')
  end
end
