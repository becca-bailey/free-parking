require 'rails_helper'

describe User do
  let(:user) {User.new}
  it "creates a invalid user"  do
    user = User.new()
    expect(user.valid?).to be false
  end

  it "creates a valid user" do
    user = User.new(name: "Colin", email: "email@email.com", password: "Hello")
    expect(user.valid?).to be true
  end

end
