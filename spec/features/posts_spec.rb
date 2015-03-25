require 'rails_helper'


feature "Posts" do

  before :each do
    @user = User.create(first_name: "Pam", last_name: "Adams", email: "pwadams@me.com", password: "password")
    @post = Post.create(title: "this is a title of a post", user_id: @user.id)
  end

  scenario 'Root Path has list of posts' do
    visit root_path
    expect(page).to have_content("this is a title of a post")

  end

  scenario 'Anyone can click on a post to view its comments' do
    comment = Comment.create(body: "this a comment of a post", user_id: @user.id, post_id: @post.id)
    visit root_path
    click_on("this is a title of a post")
    expect(page).to have_content("this a comment of a post")
  end


end
