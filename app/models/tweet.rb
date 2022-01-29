# frozen_string_literal: true

class Tweet < ApplicationRecord
  belongs_to :user

  validates :content, length: { maximum: 140 }
end
