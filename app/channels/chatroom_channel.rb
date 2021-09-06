class ChatroomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "ChatroomChannel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    stop_all_streams
  end
end
