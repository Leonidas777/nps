require 'rails_helper'

describe Api::V1::FeedbacksController do
  render_views

  describe '#create' do
    let(:params) do
      {
        score: 10,
        touchpoint: 'realtor_feedback',
        respondent_class: 'seller',
        respondent_id: 1,
        object_class: 'realtor',
        object_id: 2
      }
    end

    subject { post :create, params: params }

    it 'succeeds' do
      expect { subject }.to change(Feedback, :count).from(0).to(1)
      expect(response).to have_http_status(201)
    end
  end

  describe '#index' do
    let(:params) { { touchpoint: 'realtor_feedback' } }

    before do
      create :feedback,
        score: 7, touchpoint: 'realtor_feedback',
        respondent_class: 'seller', respondent_id: 1,
        object_class: 'realtor', object_id: 2
    end

    subject { get :index, params: params }

    it 'returns the feedbacks' do
      subject

      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)).to eq(
        'feedbacks' => [
          {
            'score'            => 7,
            'touchpoint'       => 'realtor_feedback',
            'respondent_class' => 'seller',
            'respondent_id'    => 1,
            'object_class'     => 'realtor',
            'object_id'        => 2
          }
        ]
      )
    end

    context 'when the respondent_class is provided' do
      before { params[:respondent_class] = 'buyer' }

      it 'returns []' do
        subject
        expect(JSON.parse(response.body)).to eq('feedbacks' => [])
      end
    end

    context 'when the object_class is provided' do
      before { params[:object_class] = 'deal' }

      it 'returns []' do
        subject
        expect(JSON.parse(response.body)).to eq('feedbacks' => [])
      end
    end
  end
end
