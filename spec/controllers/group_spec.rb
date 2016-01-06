require "rails_helper"

describe GroupsController do
  let!(:group) { Group.create!(name: "Test")}

  describe "GET #show" do

    it "renders the show template" do
      get :show
      expect(:group).to render_template("show")
    end
    it "assigns the requested group to @group" do
      get :show, { id: group.id }
      expect(@group).to eq(:group)
    end

  end

end
