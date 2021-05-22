require 'rails_helper'

describe Api::V1::FeedbacksController do
  describe '#create' do
    subject { post :create }

    it 'succeeds' do
      subject
      expect(response).to have_http_status(201)
    end
  end

  describe '#show' do
    subject { get :show }

    it 'succeeds' do
      subject
      expect(response).to have_http_status(200)
    end
  end
end
