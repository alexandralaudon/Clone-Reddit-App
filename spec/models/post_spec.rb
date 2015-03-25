require 'rails_helper'

describe Post do
  describe 'validations' do
    before :each do
      @user1 = User.create!(first_name: "hello", last_name: "world", email: 'hello@world.net', password: 'password')
    end

    it 'requires title to be valid' do
      post1 = Post.create(user_id: @user1.id)
      post2 = Post.create(title: 'I don\'t know what to type here', user_id: @user1.id)
      expect(post1.errors.present?).to eq(true)
      expect(post2.errors.present?).to eq(false)
    end

  end

  describe 'associations' do
    before :each do
      @user2 = User.create!(first_name: "hello", last_name: "world", email: 'hello@world.net', password: 'password')
      @post = Post.create(title: 'I don\'t know what to type here', user_id: @user2.id)
    end

    it 'returns all associated comments' do
      comment = Comment.create(body: 'You should type something regardless', post_id: @post.id, user_id: @user2.id )
      expect(@post.comments).to eq(Array(comment))
    # has_many comments
    end
    it 'returns an associated user' do
      expect(@post.user).to eq(@user2)

    # belongs_to user
    end
  end

end
