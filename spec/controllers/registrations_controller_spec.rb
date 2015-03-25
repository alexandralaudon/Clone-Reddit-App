require 'rails_helper'

describe RegistrationsController do
  it 'GETS #new' do
    get :new
    expect(response).to render_template(:new)
  end
  
end
