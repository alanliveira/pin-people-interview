require 'swagger_helper'

RSpec.describe 'Api::V1::QuestionAnswers', type: :request do
  path '/api/v1/employees/{employee_id}/question_answers' do
    get 'Lista todos os question_answers' do
      tags 'EmployeeQuestionAnswers'
      produces 'application/json'

      parameter name: :employee_id, in: :path, type: :integer, description: 'ID do empregado'

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

        let!(:employee) { create(:employee) }
        let(:employee_id) { employee.id }

        run_test! do
          puts request.host
          body = JSON.parse(response.body)
          expect(body['question_answers'].size).to eq(10)
        end
      end
    end
  end

  path '/api/v1/employees/{employee_id}/question_answers/{id}' do
    get 'Retorna um question_answer' do
      tags 'EmployeeQuestionAnswers'
      produces 'application/json'

      parameter name: :employee_id, in: :path, type: :integer, description: 'ID do empregado'
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

        let!(:employee) { create(:employee) }
        let(:employee_id) { employee.id }

        let!(:question_answer) { create(:question_answer) }
        let(:id) { question_answer.id }

        run_test! do
          body = JSON.parse(response.body)
          expect(body['question_answer']['id']).to eq(question_answer.id)
        end
      end
    end
  end

  path '/api/v1/employees/{employee_id}/question_answers/{id}' do
    put 'Atualiza um question_answer' do
      tags 'EmployeeQuestionAnswers'
      consumes 'application/json'
      produces 'application/json'

      parameter name: :id, in: :path, type: :integer, description: 'ID do question_answer'
      parameter name: :employee_id, in: :path, type: :integer, description: 'ID do empregado'

      parameter name: :question_answer, in: :body, schema: {
        type: :object,
        properties: {
          question_answer: {
            type: :object,
            properties: {
              employee_id: { type: :integer },
              question_id: { type: :integer }
            }
          }
        }
      }

      let!(:employee) { create(:employee) }
      let(:employee_id) { employee.id }

      let!(:question_answer_record) { create(:question_answer, employee: employee) }
      let(:id) { question_answer_record.id }

      let(:question_answer) do
        {
          question_answer: {
            search_id: create(:search).id
          }
        }
      end

      response '200', 'question_answer atualizado' do
        run_test! do |response|
          body = JSON.parse(response.body)
          expect(body['question_answer']['employee_id']).to eq(employee.id)
          expect(body['question_answer']['search_id']).to eq(question_answer[:question_answer][:search_id])
        end
      end

      response '422', 'dados inválidos' do
        let(:question_answer) do
          { question_answer: { employee_id: nil, question_id: nil } }
        end

        run_test! do |response|
          body = ActiveSupport::JSON.decode(response.body)
          expect(body['errors']).to be_present
        end
      end
    end
  end
end
