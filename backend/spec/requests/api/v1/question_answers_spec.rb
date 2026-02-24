require 'rails_helper'

RSpec.describe "Api::V1::QuestionAnswers", type: :request do
  describe "GET /index" do
    let!(:question_answers) { create_list(:question_answer, 10) }
    let(:question_answer_id) { question_answers.first.id }

    it 'return all question_answers' do
      get api_v1_question_answers_path
      request.headers["Accept"] = "application/json"

      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)).to be_kind_of(Hash)
      expect(JSON.parse(response.body)["question_answers"]).to be_kind_of(Array)
      expect(JSON.parse(response.body)["question_answers"].count).to eq(10)
    end

    it 'return a single question_answer' do
      get api_v1_question_answer_path(question_answer_id)

      expect(response).to have_http_status(:ok)
    end
  end
end
