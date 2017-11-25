defmodule Rumbl.Repo do
  # use Ecto.Repo, otp_app: :rumbl
  @moduledoc """
  In Memort repository
  """

  def all(Rumbl.User) do
    [%Rumbl.User{id: "1", name: "Jose 1", username: "josevalim", password: "elixir"},
    %Rumbl.User{id: "2", name: "Jose 2", username: "josevalim2", password: "elixir2"},
    %Rumbl.User{id: "3", name: "Jose 3", username: "josevalim3", password: "elixir3"}
    ]
  end

  def all(_module), do: []

  def get(module, id) do
    all(module)
    |> Enum.find(&(&1.id == id))
  end

  def get_by(module, params) do
    Enum.find all(module), fn map ->
      Enum.all?(params, fn {key, val} -> Map.get(map, key) == val end)
    end
  end
end
