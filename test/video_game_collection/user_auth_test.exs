defmodule VideoGameCollection.UserAuthTest do
  use VideoGameCollection.DataCase
  alias VideoGameCollection.{Accounts, User}
  alias VideoGameCollection.Accounts.UserAuth

  describe "UserAuth.login/2" do
    test "login should return user for a good login" do
      password = "warlock76"
      params = %{name: "Kel Cecil", email: "kelcecil@praisechaos.com", password: password}
      assert {:ok, %User{email: email}} = Accounts.create(params)

      assert %User{email: ^email} = UserAuth.login(email, password)
    end

    test "should return nil for a bad login" do
      assert UserAuth.login("doesnotexist@nope.com", "nopeitynope") == nil
    end
  end
end
