require 'rails_helper'

describe Game do
  let(:group) {Group.new}

  it "creates a invalid group"  do
    group = Group.new()
    expect(group.valid?).to be false
  end

  it "creates a valid group" do
    group = Group.new(name: "Dnd lovers")
    expect(group.valid?).to be true
  end


  it "should have many members" do
    t = Group.reflect_on_association(:members)
    t.macro.should == :has_many
  end

  it "should have many games" do
    t = Group.reflect_on_association(:games)
    t.macro.should == :has_many
  end

end