defmodule VideoGameCollectionWeb.CollectionChannel do
  use Phoenix.Channel
  alias VideoGameCollection.Accounts

  def join("collection:" <> _user_id, _params, socket) do
    # TODO: Check permissions to view collection here.
    {:ok, socket}
  end

  def handle_in("new_search_suggestion", %{"query" => query}, socket) do
    users = Accounts.find_user(query)
    push(socket, "user_search_results", %{"users" => users})
    {:noreply, socket}
  end

  def handle_in("add_user", %{"email" => email}) do
    # TODO: Finish.
    Accounts.share_collection()
  end
end
