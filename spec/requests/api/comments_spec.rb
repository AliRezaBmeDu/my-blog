require 'rails_helper'

RSpec.describe 'API::Comments', type: :request do
  it 'lists all comments for a user\'s post' do
    user = create(:user)
    post = create(:post, user:)
    get "/api/users/#{user.id}/posts/#{post.id}/comments"
    expect(response).to have_http_status(200)
  end

  it 'adds a comment to a post' do
    user = create(:user)
    post = create(:post, user:)
    comment_params = { text: 'Your comment text' }
    post "/api/users/#{user.id}/posts/#{post.id}/comments", params: { comment: comment_params }
    expect(response).to have_http_status(201)
  end
end
