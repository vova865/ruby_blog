# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Article, type: :model do
  subject {
    described_class.new(title: 'Rep. Buddy Shieldsz',
                body: 'Thundercats beard vice dis] yr tousled echo. Shoreditch chillwave farm-to-tjean shorts 9sa.kda0',
                views: 0)
  }


  before { subject.save }

  it 'title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'body should be present' do
    subject.body = nil
    expect(subject).to_not be_valid
  end

  it 'views should be present' do
    subject.views = nil
    expect(subject).to_not be_valid
  end

  it 'title at least 10 characters long' do
    subject.title = 'a'
    expect(subject).to_not be_valid
  end

  it 'title should not be too long' do
    subject.title = 'a' * 2000
    expect(subject).to_not be_valid
  end

  it 'has a body between 20 and 1000 characters' do
    expect(subject.body.length).to be_between(20, 1000).inclusive
  end

  it 'has numerical views' do
    expect(subject.views).to be_a(Integer)
  end

end
