defmodule VideoGameCollectionWeb.ChatLive do
  alias VideoGameCollection.Accounts
  use VideoGameCollectionWeb, :live_view
  alias Phoenix.PubSub

  @chat_topic "chat:all"

  def mount(_params, %{"user_token" => user_token}, socket) do
    PubSub.subscribe(VideoGameCollection.PubSub, @chat_topic)

    # Verify token and look up the user.
    {:ok, id} =
      Phoenix.Token.verify(VideoGameCollectionWeb.Endpoint, "randomized_salt", user_token)

    {:ok,
     socket
     |> assign(:authenticated_user, Accounts.get(id))
     |> assign(:messages, [])}
  end

  def handle_event("new-message", payload, socket) do
    name = socket.assigns[:authenticated_user].name
    message = payload |> Map.get("chat") |> Map.get("message")

    broadcast_payload = {:new_message, name, DateTime.now!("Etc/UTC"), message}
    PubSub.broadcast(VideoGameCollection.PubSub, @chat_topic, broadcast_payload)
    {:noreply, socket}
  end

  def handle_info({:new_message, name, timestamp, message}, socket) do
    updated_messages = [{name, timestamp, message} | socket.assigns.messages]
    {:noreply, assign(socket, :messages, updated_messages)}
  end
end
