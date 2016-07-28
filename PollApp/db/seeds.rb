# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

 # User.create!(user_name: "Bob")
# entered through pry console during development
c = User.create!(user_name: "Cat")
j = User.create!(user_name: "Jane")
b = User.create!(user_name: "Boba")
s = User.create!(user_name: "Sally")

# Poll.create!(title: "first poll", author_id: bob.id)
# entered through pry console during development
pollA = Poll.create!(title: "Cat poll", author_id: c.id)
pollB = Poll.create!(title: "cool poll", author_id: s.id)
pollC = Poll.create!(title: "controversial poll", author_id: j.id)
pollD = Poll.create!(title: "secret poll", author_id: c.id)

# Question.create!(poll_id = p.id, question_text = "why did we do AA?")
# entered through pry console during development
q1 = Question.create!(poll_id: 1, question_text: "how are you liking AA?")
q2 = Question.create!(poll_id: 1, question_text: "how are we going to pay for AA?")
q3 = Question.create!(poll_id: 2, question_text: "what is a question?")
q3 = Question.create!(poll_id: 4, question_text: "pepsi or coke?")
q3 = Question.create!(poll_id: 5, question_text: "where is the treasure?")
q3 = Question.create!(poll_id: 5, question_text: "do dead men tell tales?")

# AnswerChoice.create!(question_id: 1, answer_text: "money")
# entered through pry console during development
ac1 = AnswerChoice.create!(question_id: 1, answer_text: "love")
ac2 = AnswerChoice.create!(question_id: 5, answer_text: "sprite")
ac2 = AnswerChoice.create!(question_id: 5, answer_text: "coke")
ac2 = AnswerChoice.create!(question_id: 5, answer_text: "pepsi")
ac2 = AnswerChoice.create!(question_id: 6, answer_text: "on treausre island, duh")

# Response.create!(answer_choice_id: 1, user_id: 2)
# entered through pry console during development
r1 = Response.create!(answer_choice_id: 2, user_id: 3)
r2 = Response.create!(answer_choice_id: 1, user_id: 4)
r3 = Response.create!(answer_choice_id: 3, user_id: 2)
