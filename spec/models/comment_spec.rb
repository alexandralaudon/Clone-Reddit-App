require 'rails_helper'

describe Comment do

  describe 'validations' do
    it 'requires body to be valid' do
      user = User.create(first_name: "pam", last_name: "Adams", email: "pwadams@me.com", password: "password")
      post = Post.create(title: "this is a post", user_id: user.id)
      comment = Comment.create(body: "this is the body", user_id: user.id, post_id: post.id)
      comment2 = Comment.create(user_id: user.id, post_id: post.id)
      expect(comment.errors.present?). to eq(false)
      expect(comment2.errors.present?). to eq(true)

    end
  end

  describe 'associations' do
    before :each do
      @user = User.create(first_name: "pam", last_name: "Adams", email: "pwadams@me.com", password: "password")
      @post = Post.create(title: "this is a post", user_id: @user.id)
      @comment = Comment.create(body: "this is the body", user_id: @user.id, post_id: @post.id)
    end

    it 'returns an associated user' do
      expect(@comment.user).to eq(@user)
    end

    it 'returns an associated post' do
      expect(@comment.post).to eq(@post)
    end
  end

end
