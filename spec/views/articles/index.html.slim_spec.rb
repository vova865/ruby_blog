# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'articles/index', type: :view do
  current_user = User.first_or_create!(email: 'test@gmail.com', password: 'password', password_confirmation: 'password', name: 'name')
  category = Category.first_or_create!(name: 'Business')
  before(:each) do
    assign(:articles, [
             Article.create!(
               title: 'Rails Testing',
               body: 'How to test Ruby on Rails applications. Some other text',
               views: 2,
               category: category,
               user: current_user
             )
           ])
  end

  it 'renders a list of articles' do
    render

    expect(rendered).to match(/Rails Testing/)
  end
end
