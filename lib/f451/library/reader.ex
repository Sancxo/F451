defmodule F451.Library.Reader do
  use Ecto.Schema
  use Waffle.Ecto.Schema
  import Ecto.Changeset

  schema "readers" do
    field :avatar, F451.ReadersAvatar.Type
    field :first_name, :string
    field :last_name, :string
    field :pseudo, :string

    has_many :books, F451.Library.Book

    timestamps()
  end

  @doc false
  def changeset(reader, attrs) do
    reader
    |> cast(attrs, [:first_name, :last_name, :pseudo])
    |> cast_attachments(attrs, [:avatar])
    |> validate_required([:first_name, :last_name])
  end
end
