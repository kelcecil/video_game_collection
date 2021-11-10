defmodule VideoGameCollection.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Bcrypt

  alias VideoGameCollection.Game

  @derive {Jason.Encoder, except: [:__meta__, :password, :password_hash, :games, :guests]}

  schema "users" do
    field :name, :string
    field :email, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    has_many :games, Game
    many_to_many :guests, __MODULE__,
      join_through: "permissions",
      join_keys: [owner_id: :id, receipient_id: :id],
      on_replace: :delete

    timestamps()
  end

  def changeset(%__MODULE__{} = user, attrs) do
    user
    |> cast(attrs, [:name, :email, :password])
  end

  def guests_changeset(%__MODULE__{} = user, attrs) do
    user
    |> cast(attrs, [])
    |> put_assoc(:guests, attrs.guests)
  end

  def create_changeset(%__MODULE__{} = user, attrs) do
    user
    |> cast(attrs, [:name, :email, :password])
    |> validate_required([:name, :email, :password])
    |> validate_length(:password, min: 8)
    |> validate_format(:email, ~r/@/)
    |> put_password_hash()
  end

  defp put_password_hash(
         %Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset
       ) do
    put_change(changeset, :password_hash, Bcrypt.hash_pwd_salt(password))
  end

  defp put_password_hash(changeset) do
    changeset
  end
end
