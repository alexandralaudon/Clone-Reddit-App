require 'rails_helper'

describe PostsController do
  it 'GETS #index' do
    user = User.create!(first_name: 'aaaa', last_name: 'bbbbbb', email: 'cccccc@dddd.com', password: 'password')
    post = Post.create!(title: 'whtever booooo', user_id: user.id)

    get :index
    expect(response).to render_template(:index)
  end

end
