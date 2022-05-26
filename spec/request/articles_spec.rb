# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Articles', type: :request do
  current_user = User.first_or_create!(email: 'test@gmail.com', password: 'password', password_confirmation: 'password', name: 'name')
  category = Category.first_or_create!(name: 'Business')
  let(:valid_attributes) {
    skip(title: 'Test articles', body: 'Controller specs are RSpec wrappers for Rails functiona some ;alskjdfoij;lknx,',
         category: category, current_user: current_user)
  }

  describe 'Get index' do
    it 'renders a successful response' do
      Article.create! valid_attributes
      get articles_url
      expect(response).to be_successful
      # expect(response.body).to include('Test articles')
    end
  end
end

