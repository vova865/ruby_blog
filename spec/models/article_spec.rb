# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Article, type: :model do
  subject {
 Article.new(title: 'Rep. Buddy Shieldsz',
             body: 'Thundercats beard vice dis] yr tousled echo. Shoreditch chillwave farm-to-table jean shorts 9sa.kda0',
             views: 0, user_id: 1, category_id: 1, image_data: {id: '3d7bdf2bbd2132218eeabd94b846fde2.png',storage:'store',
             metadata: {filename:'9f8fdff471b7d281f81f694c100b5adc.png',size:184520,mime_type:'image/png'}} ) }

  it 'has a title' do

  end

  it 'has a body' do

  end

  it 'has a title at least 10 characters long' do

  end

  it 'has a body between 40 and 1000 characters' do

  end

  it 'has numerical views' do

  end

  it 'is valid with valid attributes' do
    expect(Article.new).to be_valid
  end
end
