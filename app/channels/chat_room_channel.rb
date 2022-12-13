class ChatRoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_room_2"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    Message.create(user_id: 2, message: data["message"], room_id: 1)
    # byebug
    ActionCable.server.broadcast "chat_room_2", message: data["message"], sent_by: data["name"], room: Room.last.id
  end

  def announce(data)
    ActionCable.server.broadcast "chat_room_2", chat_room_name: data["name"], type: data["type"], room: Room.last.id
  end
end
