# encoding: UTF-8
# frozen_string_literal: true

describe API::V2::Public::Tools, type: :request do
  describe '/timestamp' do
    it 'returns current time in seconds' do
      now = Time.now
      get '/api/v2/public/timestamp'
      expect(response).to be_success
      expect(JSON.parse(response.body)).to be_between(now.iso8601, (now + 1).iso8601)
    end
  end
end
