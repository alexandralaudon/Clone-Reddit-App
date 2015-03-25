require 'rails_helper'

describe Post do
  describe 'validations' do
    before :each do
      @user = User.create!(first_name: "hello", last_name: "world", email: 'hello@world.net', password: 'password')
    end

    it 'requires title to be valid' do
      post1 = Post.create(user_id: @user.id)
      post2 = Post.create(title: 'I don\'t know what to type here', user_id: @user.id)
      expect(post1.errors.present?).to eq(true)
      expect(post2.errors.present?).to eq(false)
    end

  end

  describe 'associations' do
    before :each do
      @user = User.create!(first_name: "hello", last_name: "world", email: 'hello@world.net', password: 'password')
      @post = Post.create(title: 'I don\'t know what to type here', user_id: @user.id)
    end

    it 'returns all associated comments' do
      comment = Comment.create(body: 'You should type something regardless', post_id: @post.id, user_id: @user.id )
      expect(@post.comments).to eq(Array(comment))
    # has_many comments
    end
    it 'returns all associated users' do
      expect(@post.user).to eq(Array(@user))

    # belongs_to user
    end
  end

end
