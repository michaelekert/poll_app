class SendPollMilestoneEmailJob < ApplicationJob
  queue_as :default

  def perform(poll_id, count)
    poll = Poll.find(poll_id)
    PollMailer.vote_milestone_email(poll, count).deliver_now
  end
end
