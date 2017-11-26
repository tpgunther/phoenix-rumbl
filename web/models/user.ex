defmodule Rumbl.User do
  use Rumbl.Web, :model

  schema "users" do
    field :name, :string
    field :username, :string
    field :password, :string, virtual: :true
    field :password_hash, :string

    timestamps()
  end

  # require and optional fields and validations
  def changeset(model, params \\ :invalid) do
    model
    |> cast(params, ~w(name username), [])
    |> validate_length(:username, min: 1, max: 20)
  end
end
