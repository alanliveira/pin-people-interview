require 'swagger_helper'

RSpec.describe 'Api::V1::QuestionAnswers', type: :request do
  path '/api/v1/companies/{company_id}/question_answers' do
    get 'Lista todos os question_answers' do
      tags 'CompanyQuestionAnswers'
      produces 'application/json'

      parameter name: :company_id, in: :path, type: :integer, description: 'ID da company'

      response '200', 'question_answers encontrados' do
        schema type: :object,
          properties: {
            question_answers: {
              type: :array,
              items: {
                type: :object,
                properties: {
                  id: { type: :integer },
                  created_at: { type: :string },
                  complete?: { type: :boolean }
                }
              }
            }
          }

        before do
          create_list(:question_answer, 10)
        end

        let!(:company) { create(:company) }
        let(:company_id) { company.id }

        run_test! do
          puts request.host
          body = JSON.parse(response.body)
          expect(body['question_answers'].size).to eq(10)
        end
      end
    end
  end

  path '/api/v1/companies/{company_id}/question_answers/{id}' do
    get 'Retorna um question_answer' do
      tags 'CompanyQuestionAnswers'
      produces 'application/json'

      parameter name: :company_id, in: :path, type: :integer, description: 'ID da company'
      parameter name: :id, in: :path, type: :integer, description: 'ID do question_answer'

      response '200', 'question_answer encontrado' do
        schema type: :object,
          properties: {
            question_answer: {
              type: :object,
              properties: {
                id: { type: :integer },
                created_at: { type: :string },
                complete?: { type: :boolean }
              }
            }
          }

        let!(:company) { create(:company) }
        let(:company_id) { company.id }

        let!(:question_answer) { create(:question_answer) }
        let(:id) { question_answer.id }

        run_test! do
          body = JSON.parse(response.body)
          expect(body['question_answer']['id']).to eq(question_answer.id)
        end
      end
    end
  end

  path '/api/v1/companies/{company_id}/question_answers' do
    post 'Cria um question_answer' do
      tags 'CompanyQuestionAnswers'
      consumes 'application/json'
      produces 'application/json'

      parameter name: :company_id, in: :path, type: :integer, description: 'ID da company'
      parameter name: :question_answer, in: :body, schema: {
        type: :object,
        properties: {
          question_answer: {
            type: :object,
            properties: {
              employee_id: { type: :integer },
              search_id: { type: :integer }
            },
            required: %w[employee_id search_id]
          }
        }
      }

      let!(:company) { create(:company) }
      let(:company_id) { company.id }
      let(:employee) { create(:employee) }
      let(:search) { create(:search) }

      let(:question_answer) do
        {
          question_answer: {
            employee_id: employee.id,
            search_id: search.id
          }
        }
      end

      response '201', 'question_answer criado' do
        run_test! do |response|
          body = JSON.parse(response.body)
          expect(body['question_answer']['employee_id']).to eq(employee.id)
          expect(body['question_answer']['search_id']).to eq(search.id)
        end
      end

      response '422', 'dados inválidos' do
        let(:question_answer) do
          { question_answer: { employee_id: nil, search_id: nil } }
        end

        run_test! do |response|
          body = ActiveSupport::JSON.decode(response.body)
          expect(body['errors']).to be_present
        end
      end
    end
  end
end
