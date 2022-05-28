defmodule F451.Library.Author do
  use Ecto.Schema
  use Waffle.Ecto.Schema
  import Ecto.Changeset

  alias F451.Library.{Book, Country}

  schema "authors" do
    field :avatar, F451.AuthorsAvatar.Type
    field :biography, :string
    field :birthdate, :date
    field :death_date, :date
    field :first_name, :string
    field :last_name, :string

    belongs_to :country, Country

    has_many :books, Book

    timestamps()
  end

  @doc false
  def changeset(author, attrs) do
    author
    |> cast(attrs, [
      :last_name,
      :first_name,
      :country_id,
      :birthdate,
      :death_date,
      :biography
    ])
    |> cast_attachments(attrs, [:avatar])
    |> validate_required([:last_name, :birthdate, :country_id])
    |> foreign_key_constraint(:country_id)
  end
end
