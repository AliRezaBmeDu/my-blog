require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  fixtures :users

  describe "GET #index" do
    it "returns a successful response" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "renders the #index with user data" do
      get :index
      expect(response.body).to include(users(:user1).name)
      expect(response.body).to include(users(:user2).name)
    end
  end

  describe "GET #show" do
    it "returns a successful response" do
      user = User.create(name: "Test User")
      get :show, params: { id: user.id }
      expect(response).to have_http_status(:success)
    end


    it "redirects to index when user not found" do
      get :show, params: { id: 12345 } # Provide a non-existent user ID
      expect(response).to redirect_to(users_path)
      expect(flash[:alert]).to eq("User not found")
    end
  end
end
