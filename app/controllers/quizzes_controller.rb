class QuizzesController < ApplicationController

  def index
    @quizzes = Quiz.all
  end

  def show
    @quiz = Quiz.find(params[:id])
  end

  def new
    @quiz = Quiz.new
  end

  def create
    @quiz = Quiz.new(quiz_params)

    if @quiz.save
      redirect_to quizzes_path, notice: 'Quiz created.'
    else
      render :new
    end
  end

  private #----

    def quiz_params
      params.require(:quiz).permit(:name, :number_of_questions)
    end
end
