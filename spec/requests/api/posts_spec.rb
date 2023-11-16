require 'rails_helper'

RSpec.describe 'API::Posts', type: :request do
  it 'lists all posts for a user' do
    user = create(:user)
    get "/api/users/#{user.id}/posts"
    expect(response).to have_http_status(200)
  end
end
