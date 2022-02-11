require 'rails_helper'

RSpec.describe Telephone, type: :model do
  fixtures :contacts, :telephones
  it "is valid with number, field 'kind' with value 'work' and main in [true, false] " do
    telephone = Telephone.create(number:"1111-1111", kind: "work", main: false, contact_id: 1)
    expect(telephone).to be_valid 
  end

  it "is valid with number, field 'kind' with value 'other' and main in [true, false] " do
    telephone = Telephone.create(number:"2222-2222", kind: "other", main: false, contact_id: 1)
    expect(telephone).to be_valid 
  end

  it "is not valid without number" do
    telephone = Telephone.create(number: nil, kind: "other", main: false, contact_id: 1)
    expect(telephone.errors[:number]).to include("can't be blank")
  end

  it "is not valid without kind" do
    telephone = Telephone.create(number: "3333-3333", kind: nil, main: false, contact_id: 1)
    expect(telephone.errors[:kind]).to include("can't be blank")
  end

  it "is not valid without main" do
    telephone = Telephone.create(number: "4444-4444", kind: "other", main: nil, contact_id: 1 )
    expect(telephone.errors[:main]).to include("is not included in the list")
  end

  it "is not valid with any 'kind' other than [home, work, other]" do
    telephone = Telephone.create(number: "5555-5555", kind: "foo", main: false, contact_id: 1)
    expect(telephone.errors[:kind]).to include("is not included in the list")
  end

  it "is not valid when number is not unique for the same contact_id" do
    telephone = Telephone.create(number: "1234-5678", kind: "other", main: false, contact_id: 1)
    expect(telephone.errors[:number]).to include("has already been taken")
  end

  it "is not valid when main is true twice for the same id" do
    telephone = Telephone.create(number: "4321-5678", kind: "other", main: true, contact_id: 1)
    expect(telephone.errors[:main]).to include("has already been taken")
  end
end
