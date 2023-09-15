module QuestionsFactory
  def self.build(questions_array:, quiz_category:, question_class: Question)
    questions_array.map do |question_data|
      Question.new(question_data, quiz_category)
    end
  end
end