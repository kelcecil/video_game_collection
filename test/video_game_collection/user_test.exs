defmodule VideoGameCollection.UserTest do
  use VideoGameCollection.DataCase
  alias VideoGameCollection.Users

  describe "module Users.create/1" do
    test "should create a new user with correct params" do
      params = %{name: "Kel Cecil", email: "kellycecil@ucwv.edu", password: "warlock76"}
      assert {:ok, %{}} = Users.create(params)
    end

    test "should provide error if password is too short" do

    end
  end
end
