Strand.create(name: 'Nouns').tap do |strand|
  strand.standards.create(name: 'Common Nouns').tap do |standard|
    standard.questions.create(label: 1, difficulty: 0.7)
    standard.questions.create(label: 2, difficulty: 0.6)
  end
  strand.standards.create(name: 'Abstract Nouns').tap do |standard|
    standard.questions.create(label: 3, difficulty: 0.8)
  end
  strand.standards.create(name: 'Proper Nouns').tap do |standard|
    standard.questions.create(label: 4, difficulty: 0.2)
    standard.questions.create(label: 5, difficulty: 0.5)
    standard.questions.create(label: 6, difficulty: 0.4)
  end
end

Strand.create(name: 'Verbs').tap do |strand|
  strand.standards.create(name: 'Action Verbs').tap do |standard|
    standard.questions.create(label: 7, difficulty: 0.9)
    standard.questions.create(label: 8, difficulty: 0.1)
  end
  strand.standards.create(name: 'Transitive Verbs').tap do |standard|
    standard.questions.create(label: 9, difficulty: 0.3)
    standard.questions.create(label: 10, difficulty: 0.6)
    standard.questions.create(label: 11, difficulty: 0.4)
    standard.questions.create(label: 12, difficulty: 0.2)
  end
end
