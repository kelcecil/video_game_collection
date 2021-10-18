defmodule VideoGameCollection.UserAuthTest do
  use VideoGameCollection.DataCase
  alias VideoGameCollection.{Accounts, User}
  alias VideoGameCollection.Accounts.UserAuth

  describe "UserAuth.login/2" do
    test "login should return user for a good login" do
      password = "warlock76"
      params = %{name: "Kel Cecil", email: "kelcecil@praisechaos.com", password: password}
      assert {:ok, %{email: email}} = Accounts.create(params)

      assert %User{email: ^email} = UserAuth.login(email, password)
    end
  end
end
