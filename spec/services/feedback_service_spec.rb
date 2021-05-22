require 'rails_helper'

describe FeedbackService do
  describe '#store_feedback!' do
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

    subject { described_class.store_feedback!(params) }

    it 'creates a new feedback' do
      expect { subject }.to change(Feedback, :count).from(0).to(1)

      feedback = Feedback.last
      expect(feedback.score).to eq(10)
      expect(feedback.touchpoint).to eq('realtor_feedback')
      expect(feedback.respondent_class).to eq('seller')
      expect(feedback.respondent_id).to eq(1)
      expect(feedback.object_class).to eq('realtor')
      expect(feedback.object_id).to eq(2)
    end

    it 'returns true' do
      expect(subject).to eq(true)
    end

    context 'when some feedback already exists' do
      let!(:feedback) do
        create :feedback,
          score: 7, touchpoint: 'realtor_feedback',
          respondent_class: 'seller', respondent_id: 1,
          object_class: 'realtor', object_id: 2
      end

      it 'rewrites the feedback that already exists' do
        expect { subject }.not_to change(Feedback, :count)
        expect(feedback.reload.score).to eq(10)
      end

      context 'when the feedback belongs to another seller' do
        before { feedback.update!(respondent_id: 2) }

        it 'creates a new feedback' do
          expect { subject }.to change(Feedback, :count).from(1).to(2)
          expect(Feedback.pluck(:score)).to eq([7, 10])
        end
      end

      context 'when the feedback is about another realtor' do
        before { feedback.update!(object_id: 3) }

        it 'creates a new feedback' do
          expect { subject }.to change(Feedback, :count).from(1).to(2)
          expect(Feedback.pluck(:score)).to eq([7, 10])
        end
      end
    end

    param_keys = %i[score touchpoint respondent_class respondent_id object_class object_id]
    param_keys.each do |param_key|
      context "when the param '#{param_key}' is not passed" do
        before { params.delete(param_key) }

        it 'raises the error' do
          expect { subject }.to raise_error(KeyError)
        end
      end
    end
  end

  describe '#get_feedbacks' do
    let(:touchpoint) { '' }
    let(:respondent_class) { '' }
    let(:object_class) { '' }

    subject do
      described_class.get_feedbacks(
        touchpoint: touchpoint, respondent_class: respondent_class,
        object_class: object_class
      )
    end

    it 'returns []' do
      expect(subject).to eq([])
    end
  end
end
