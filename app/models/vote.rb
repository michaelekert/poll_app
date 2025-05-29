class Vote < ApplicationRecord
  belongs_to :poll
  belongs_to :poll_choice

  after_create_commit :broadcast_chat
  after_create_commit :check_poll_vote_milestone

  def broadcast_chat
    broadcast_replace_to(
      "votes",
      target: "poll_choice_#{poll_choice.id}",
      partial: "polls/poll_choice",
      locals: { choice: poll_choice }
    )
  end

  def check_poll_vote_milestone
    vote_count = poll.votes.count

    if vote_count == 10
      SendPollMilestoneEmailJob.perform_later(poll.id, vote_count)
    end
  end
end
