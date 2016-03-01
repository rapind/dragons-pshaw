class Quiz < ActiveRecord::Base
  has_many :quiz_questions

  validates :name, presence: true
  validates :number_of_questions, presence: true, numericality: { only_integer: true, greater_than: 0 }

  after_create :assign_questions

  private #----

  def best_strand(questions)
    logger.debug "\n\nbest_strand: #{questions}"
    if quiz_questions.size == 0
      questions.first.standard.strand
    else
      strands = quiz_questions.group_by { |qq| qq.quiz.standard.strand_id }
      strands.sort_by{ |s| s.length }[0][1]
    end
  end

  def best_standard(questions)
    if quiz_questions.size == 0
      questions.first.standard
    else
      standards = quiz_questions.group_by { |qq| qq.quiz.standard_id }
      standards.sort_by{ |s| s.length }[0][1]
    end
  end

  def best_question(questions)
    logger.debug "\n\nbest_question: #{questions}"
    strand = best_strand(questions)
    logger.debug "\n\nSTRAND: #{strand}"
    standard = best_standard(strand[1])
    logger.debug "\n\nSTANDARD: #{standard}"
    standard
  end

  def assign_questions
    questions = Question.all
    current_question_ids = quiz_questions.pluck(:id)
    questions = questions.where("id NOT IN (?)", current_question_ids) unless current_question_ids.empty?
    questions = questions.to_a
    number_of_questions.times do
      question = best_question(questions)
      quiz_questions.create(question: question)

      # Remove it once we've assigned it
      questions = questions.select { |q| q.id != question.id }
    end
  end
end
