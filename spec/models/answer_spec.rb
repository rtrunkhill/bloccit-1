require 'rails_helper'

RSpec.describe Answer, type: :model do

   let(:question) { Question.new(title: "New Question Body", body:"New Question Body", resolved: false) }
   let(:answer) { Answer.new(question: question, body: "New Answer Body") }

    it "it should respond to the body" do
      expect(answer).to respond_to(:body)
    end
end
