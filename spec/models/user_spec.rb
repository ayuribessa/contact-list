require 'rails_helper'

RSpec.describe User, type: :model do
  it "is not valid without name" do
    fixtures :contacts
    # user = User.create(name: nil,birthday:"09/03/1994", bio:"my bio!")
    user = users(:one)
    user.valid?   
    expect(user.errors[:name]).to include("can't be blank") 
  end
  
  it "Is valid when has atribute name, birthday and bio" do
    user = User.create!(name:"Ayuri Bessa",birthday:"09/03/1994", bio:"my bio!")
    expect(user).to be_valid
  end
    
  it "does not create if the user name is already taken" do
    user = User.create(name:"Ayuri Bessa",birthday:"09/03/1994", bio:"my bio!")
    user = User.create(name:"Ayuri Bessa",birthday:"09/03/1995", bio:"my alt bio!")
    user.valid? 
    expect(user.errors[:name]).to include('has already been taken')
  end
end
