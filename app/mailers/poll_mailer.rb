class PollMailer < ApplicationMailer
  def vote_milestone_email(poll, count)
    @poll = poll
    @count = count
    mail(to: "admin@example.com", subject: "🗳️ Głosowanie '#{poll.question}' osiągneło #{count} głosów!")
  end
end
