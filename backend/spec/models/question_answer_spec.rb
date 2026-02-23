require 'rails_helper'

RSpec.describe QuestionAnswer, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of(:search) }
    it { is_expected.to validate_presence_of(:employee) }
  end

  context 'associations' do
    it { is_expected.to belong_to(:search) }
    it { is_expected.to belong_to(:employee) }
  end

  context '#complete?' do
    let(:question_answer) { create(:question_answer, completed_at: completed_at) }

    context 'when completed_at is present' do
      let(:completed_at) { Time.current }

      it 'returns true' do
        expect(question_answer.complete?).to be true
      end
    end

    context 'when completed_at is nil' do
      let(:completed_at) { nil }

      it 'returns false' do
        expect(question_answer.complete?).to be false
      end
    end
  end
end
