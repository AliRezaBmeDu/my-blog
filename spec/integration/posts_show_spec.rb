require 'rails_helper'
describe 'Post show', type: :feature do
  before(:each) do
    @first_user = User.create(name: 'Tom Cruise', photo: 'https://example.com/tom.jpg', bio: 'actor, mission impossible')
    @second_user = User.create(name: 'Mel Gibson', photo: 'https://example.com/gibson.jpg', bio: 'actor, braveheart')
    @post = Post.create(author: @first_user, title: 'MI7', text: 'Dead Reckoning first part released')
    @first_comment = Comment.create(author: @first_user, post: @post, text: 'Good movie')
    @second_comment = Comment.create(author: @first_user, post: @post, text: 'Thank you')
    @third_comment = Comment.create(author: @second_user, post: @post, text: 'Welcome')
    @first_like = Like.create(post: @post, user: @first_user)
    @second_like = Like.create(post: @post, user: @first_user)
    @third_like = Like.create(post: @post, user: @first_user)
    visit user_posts_path(@first_user, @post)
  end
end