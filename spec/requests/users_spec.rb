require 'rails_helper'

RSpec.describe 'Users Tests', type: :request do
  context 'Index' do
    before(:each) do
      get '/users'
    end
    it 'Redirects correctly to Index template' do
      expect(response).to render_template(:index)
    end
    it 'Is a success status' do
      expect(response).to have_http_status(:ok)
    end
    it 'Includes correct placeholder text.' do
      expect(response.body).to include('Here is a List of Users')
    end
  end
  context 'Show' do
    before(:each) do
      get '/users/1'
    end
    it 'Redirects correctly to Show template' do
      expect(response).to render_template(:show)
    end
    it 'Is a success status' do
      expect(response).to have_http_status(:ok)
    end
    it 'Includes correct placeholder text.' do
      expect(response.body).to include('Show User Info for a given user')
    end
  end
end
