require 'rails_helper'

RSpec.describe PostsController, type: :request do
  describe 'GET #index' do
    let(:user) { User.create(
      name: "Tom Cruise",
      posts_counter: 0,
      bio: "actor",
      photo: "https://example.com/tom.jpg"
    ) }

    before do
      user.posts.create(title: 'First Post', text: 'Content of post 1')
      user.posts.create(title: 'Second Post', text: 'Content of post 2')
    end

    it 'returns a successful response' do
      get user_posts_path(user)
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      get user_posts_path(user)
      expect(response).to render_template(:index)
    end

    it 'includes correct placeholder text in the response body' do
      get user_posts_path(user)
      expect(response.body).to include("All the posts of #{user.name}")
      expect(response.body).to include('First Post')   # Correct the case of "Post"
      expect(response.body).to include('Content of post 1')  # Correct the content
      expect(response.body).to include('Second Post')  # Correct the case of "Post"
      expect(response.body).to include('Content of post 2')  # Correct the content
    end
  end
end
