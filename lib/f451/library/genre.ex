defmodule F451.Library.Genre do
  use Ecto.Schema
  import Ecto.Changeset

  schema "genres" do
    field :name, :string

    has_many :books, F451.Library.Book

    timestamps()
  end

  @doc false
  def changeset(genre, attrs) do
    genre
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
