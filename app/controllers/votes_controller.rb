class VotesController < ApplicationController
  def create
    poll = Poll.find(params[:poll_id])
    choice = poll.poll_choices.find(params[:poll_choice_id])


    Vote.create!(
      poll: poll,
      poll_choice: choice
    )

    render json: {}, status: :no_content
  end
end
