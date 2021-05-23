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

    context 'when the score is invalid' do
      before { params[:score] = 25 }

      it 'does not succeed' do
        expect { subject }.not_to change(Feedback, :count)

        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body)).to eq('errors' => [{ 'message' => 'Validation failed: Score is not included in the list' }])
      end
    end

    context 'when the touchpoint is invalid' do
      before { params[:touchpoint] = 'invalid_touchpoint' }

      it 'does not succeed' do
        expect { subject }.not_to change(Feedback, :count)

        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body)).to eq('errors' => [{ 'message' => 'Validation failed: Touchpoint is not included in the list' }])
      end
    end

    context 'when the object_class is invalid' do
      before { params[:object_class] = 'invalid_object_class' }

      it 'does not succeed' do
        expect { subject }.not_to change(Feedback, :count)

        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body)).to eq('errors' => [{ 'message' => 'Validation failed: Object class is not included in the list' }])
      end
    end

    context 'when the respondent_class is invalid' do
      before { params[:respondent_class] = 'invalid_respondent_class' }

      it 'does not succeed' do
        expect { subject }.not_to change(Feedback, :count)

        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body)).to eq('errors' => [{ 'message' => 'Validation failed: Respondent class is not included in the list' }])
      end
    end

    param_keys = %i[score touchpoint respondent_class respondent_id object_class object_id]
    param_keys.each do |param_key|
      context "when the param '#{param_key}' has not been provided" do
        before { params.delete(param_key) }

        it 'returns the error response' do
          subject

          expect(response).to have_http_status(:unprocessable_entity)
          expect(JSON.parse(response.body)).to eq('errors' => [{ 'message' => 'Not all parameters have been provided' }])
        end
      end
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
