defmodule VideoGameCollectionWeb.LayoutView do
  use VideoGameCollectionWeb, :view
  alias VideoGameCollection.User

  def is_signed_in?(conn) do
    case Map.get(conn.assigns, :authenticated_user, nil) do
      %User{} -> true
      _ -> false
    end
  end
end
