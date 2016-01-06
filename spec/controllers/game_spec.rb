require "rails_helper"

describe GamesController do

  let!(:game) { Game.create!(name: "Dnd", min_players: 5, max_players: 5) }

  describe "GET #show" do
    it "renders the show template" do
      get :show
      expect(game).to render_template("show")
    end
    it "assigns the requested group to @game" do
      get :show, { id: game }
      expect(assigns(:game)).to eq(game)
    end
  end

  describe "GET #new" do
      it "renders the new template" do
        get :new
        expect(game).to render_template("new")
      end
  end

  describe "POST #create" do
    context "when valid params are passed" do

      it "creates a new game" do
        post :create, game: { name: "D&D", min_players: 2, max_players: 3 }
        expect(game).to be_a(Game)
      end

      it "assigns a new game as @game" do
        post :create, game: { name: "D&D&D", min_players: 2, max_players: 3 }
        expect(assigns(:game)).to eq(Game.last)
      end

    end
  end

end
