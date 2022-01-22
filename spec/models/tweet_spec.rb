require 'rails_helper'

RSpec.describe Tweet, type: :model do
  it 'is invalid with more than 140 content' do
    tweet = build(:tweet, content: Faker::Lorem.characters(number: 141))
    tweet.valid?
    expect(tweet.errors[:content]).to include('is too long (maximum is 140 characters)')
  end
end
