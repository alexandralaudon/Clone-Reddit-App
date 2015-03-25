require 'rails_helper'

describe RegistrationsController do
  before :each do
    @user = User.create(first_name: 'aaaa', last_name: 'bbbb', email: 'ccccc', password: 'password')
  end

  it 'GETS #new' do
    get :new
    expect(response).to render_template(:new)
  end

  it "POST #create" do
    expect {
      post :create, post: {title: 'eeeeeeeeee', user_id: @user.id}
    }.to change{Post.all.count}.from(0).to(1)

    post = Post.last
    
    #expect(post.).to
  end

end
