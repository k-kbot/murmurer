# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Tweets', type: :request do
  describe 'GET /index' do
    xit 'returns http success' do
      get root_path
      expect(response).to have_http_status(:success)
    end
  end
end
