class Quiz < ActiveRecord::Base
  has_many :quiz_questions
  has_many :questions, through: :quiz_questions

  validates :name, presence: true
  validates :number_of_questions, presence: true, numericality: { only_integer: true, greater_than: 0 }

  after_create :assign_questions

  private #----

  def best_question
    # Find the best strand and standard to pick from.
    strand = best_strand
    standard = best_standard_given_strand(strand)

    if quiz_questions.empty?
      # Grab the first question
      standard.questions.first
    else
      # Grab the first question we haven't already assigned
      standard.questions.where("id NOT IN (?)", quiz_questions.pluck(:question_id)).first
    end
  end

  def best_strand
    # If we haven't picked any questions, grab the first strand.
    # The (true) forces rails to reload the association, otherwise it's cached.
    if questions(true).empty?
      return Strand.first
    end

    # If we're missing any strands, grab the first one we're still missing.
    all_ids = Strand.all.pluck(:id)
    ids = questions.map { |q| q.standard.strand_id }
    missing_ids = all_ids - ids
    unless missing_ids.empty?
      return Strand.find(missing_ids[0])
    end

    # If we have all of the strands covered, use the one that we've assigned the least.
    ids_grouped = ids.group_by{ |a| a }.sort_by{ |a| a[1].length }[0]
    id = ids_grouped[0]
    Strand.find(id)
  end

  def best_standard_given_strand(strand)
    # If we're missing any standards, grab the first one we're still missing.
    all_ids = strand.standards.pluck(:id)
    ids = questions.joins(:standard).where(standards: { strand_id: strand.id }).pluck(:standard_id)
    missing_ids = all_ids - ids
    unless missing_ids.empty?
      return Standard.find(missing_ids[0])
    end

    # If we have all of the standards covered, use the one that we've assigned the least.
    ids_grouped = ids.group_by{ |a| a }.sort_by{ |a| a[1].length }[0]
    id = ids_grouped[0]
    Standard.find(id)
  end

  def assign_questions
    number_of_questions.times do
      question = best_question
      quiz_questions.create(question_id: question.id) if question
    end
  end
end
