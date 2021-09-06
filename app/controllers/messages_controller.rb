class MessagesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.user_id = User.first.id # TODO User for example, need to be current_user
    if @message.save
      ActionCable.server.broadcast 'chatroom_channel',
                                  content: @message.body
    end
    redirect_to '/chatroom'
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end

  def message_render(message)
    render(partial: 'message', locals: { message: message })
  end
end
