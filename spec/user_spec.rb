require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with valid attributes' do
    user = User.new(
      name: 'Tom Cruise',
      posts_counter: 0,
      photo: 'https://example.com/photo.jpg'
    )
    expect(user).to be_valid
  end

  it 'is not valid without a name' do
    user = User.new(name: nil)
    expect(user).to_not be_valid
  end

  it 'is not valid with a name exceeding 255 characters' do
    user = User.new(name: 'A' * 256)
    expect(user).to_not be_valid
  end

  it 'is not valid with a negative posts_counter' do
    user = User.new(posts_counter: -1)
    expect(user).to_not be_valid
  end
  
end
