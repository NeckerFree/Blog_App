require 'rails_helper'

RSpec.describe 'Posts Tests', type: :request do
  context 'Index' do
    before(:each) do
      get '/users/2/posts'
    end
    it 'Redirects correctly to index template' do
      expect(response).to render_template(:index)
    end
    it 'Is a success status' do
      expect(response).to have_http_status(:ok)
    end
    it 'Includes correct placeholder text.' do
      expect(response.body).to include('Here is a list of posts for a given user')
    end
  end
  context 'Show' do
    before(:each) do
      get '/users/2/posts/7'
    end
    it 'Redirects correctly to Show template' do
      expect(response).to render_template(:show)
    end
    it 'Is a success status' do
      expect(response).to have_http_status(:ok)
    end
    it 'Includes correct placeholder text.' do
      expect(response.body).to include('Show given Post Info for a given user')
    end
  end
end
