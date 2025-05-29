
puts "Seeding polls..."

# Wyczyść dane w odpowiedniej kolejności
Vote.delete_all
PollChoice.delete_all
Poll.delete_all

# Statyczne dane do seedów
polls_data = [
  {
    question: "Jaki jest Twój ulubiony język programowania?",
    email: "admin@example.com",
    choices: [ "Ruby", "Python", "JavaScript", "Go" ]
  },
  {
    question: "Jaki jest Twój ulubiony system operacyjny?",
    email: "user@example.com",
    choices: [ "Linux", "Windows", "macOS" ]
  },
  {
    question: "Wolisz kawę czy herbatę?",
    email: "coffee_lover@example.com",
    choices: [ "Kawa", "Herbata", "Nie piję" ]
  }
]

polls_data.each do |poll_data|
  poll = Poll.create!(
    question: poll_data[:question],
    email: poll_data[:email]
  )

  poll_data[:choices].each do |choice_name|
    PollChoice.create!(
      poll: poll,
      name: choice_name,
      identifier: choice_name.parameterize
    )
  end
end

puts "Seeding complete."
