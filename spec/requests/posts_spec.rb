require 'rails_helper'

RSpec.describe PostsController, type: :request do
  let(:user) { User.create(
      name: "Tom Cruise",
      posts_counter: 0,
      bio: "actor",
      photo: "https://example.com/tom.jpg"
    ) }

  describe 'GET #index' do
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
      expect(response.body).to include('First Post')
      expect(response.body).to include('Content of post 1')
      expect(response.body).to include('Second Post')
      expect(response.body).to include('Content of post 2')
    end
  end

  describe 'GET #show' do
    let(:post) { 
      user.posts.create(
        title: 'Hello', 
        text: 'This is my first post'
      ) }

    it 'returns a successful response' do
      get user_post_path(user_id: user, format: post)
      expect(response).to have_http_status(:success)
    end

    it 'renders the show template' do
      get user_post_path(user_id: user, format: post)
      expect(response).to render_template(:show)
    end

    it 'includes correct placeholder text in the response body' do
      get user_post_path(user_id: user, format: post)
      expect(response.body).to include("author: #{user.name}")
      expect(response.body).to include('Hello')
      expect(response.body).to include('This is my first post')
    end
  end
end