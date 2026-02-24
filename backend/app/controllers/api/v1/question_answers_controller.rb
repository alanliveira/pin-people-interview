class Api::V1::QuestionAnswersController < ApplicationController
  before_action :set_question_answers, only: [ :show ]

  def index
    @question_answers = QuestionAnswer.all
  end

  def show; end

  def create
    @question_answer = QuestionAnswer.new(question_answer_params)

    if @question_answer.save
      render :show, status: :created
    else
      render json: { errors: @question_answer.errors }, status: :unprocessable_entity
    end
  end

  def update
    @question_answer = QuestionAnswer.find(params[:id])

    if @question_answer.update(question_answer_params)
      render :show, status: :ok
    else
      render json: { errors: @question_answer.errors }, status: :unprocessable_entity
    end
  end

  private

  def set_question_answers
    @question_answer = QuestionAnswer.find(params[:id])
  end

  def question_answer_params
    params.require(:question_answer).permit(:employee_id, :search_id, :completed_at)
  end
end
