class PollsController < ApplicationController
  def index
    @polls = Poll.all
    @votes = Rails.cache.fetch("votes:count", expires_in: 30.seconds) do
      Vote.count
    end
  end

  def show
    @poll = Poll.find(params[:id])
    @poll_choices = @poll.poll_choices.includes(:votes)
  end
end
