require 'rails_helper'


describe User do
  describe 'validations' do
    before :each do
      @user2 = User.create(first_name: "Alex", last_name: "laudon", email: "whatever@me.com", password: "password")
    end

    it 'requires that first name is valid' do
      user1 = User.create(last_name: "Adams", email: "pwadams@me.com", password: "password")
      expect(user1.errors.present?).to eq(true)
      expect(@user2.errors.present?).to eq(false)
    end

    it 'requires that last name is valid' do
      user1 = User.create(first_name: "Pam", email: "pwadams@me.com", password: "password")
      expect(user1.errors.present?).to eq(true)
      expect(@user2.errors.present?).to eq(false)
    end

    it 'requires that email is valid' do
      user1 = User.create(first_name: "Pamela", last_name: "Adams", email: "pwadams@me.com", password: "password")
      user3 = User.create(first_name: "Alex", last_name: "laudon", password: "password")
      expect(user1.errors.present?).to eq(false)
      expect(@user2.errors.present?).to eq(false)
      expect(user3.errors.present?).to eq(true)
    end

    it 'requires that password is valid' do
      user1 = User.create(first_name: "Pamela", last_name: "Adams", email: "pwadams@me.com")
      expect(user1.errors.present?).to eq(true)
      expect(@user2.errors.present?).to eq(false)
    end
  end

  describe 'associations' do
    before :each do
      @user2 = User.create(first_name: "Alex", last_name: "laudon", email: "pwadams@me.com", password: "password")
      @post = Post.create(title: 'Hello world, whaz up?', user_id: @user2.id)
    end

    it 'User has_many Posts' do
      expect(@user2.posts).to eq(Array(@post))
    end

    it 'User has_many Comments' do
      comment = Comment.create(body: "we're creating apps, man!", post_id: @post.id, user_id: @user2.id)
      expect(@user2.comments).to eq(Array(comment))
    end
  end


end
