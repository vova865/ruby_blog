# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  describe 'GET index' do
    it 'returns http success' do
      get :index
      expect(response).to be_successful
    end

    it 'assigns @articles' do
      article = Article.create(title: 'Test articles',
                               body: 'Controller specs are RSpec wrappers for Rails functional tests. They simulate a
single HTTP request in each example. By default views are not rendered; the controller spec stubs views with a template
that renders an empty string (the template must exist). ')
      get :index
      expect(assigns(:article)).to eq([article])
    end

    it 'render the index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end
end
