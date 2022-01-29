# frozen_string_literal: true

# == Schema Information
#
# Table name: tweets
#
#  id         :bigint           not null, primary key
#  content    :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_tweets_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Tweet, type: :model do
  it 'is invalid with more than 140 content' do
    tweet = build(:tweet, content: Faker::Lorem.characters(number: 141))
    tweet.valid?
    expect(tweet.errors[:content]).to include('is too long (maximum is 140 characters)')
  end
end
