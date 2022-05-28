defmodule F451.Library.Book do
  use Ecto.Schema
  import Ecto.Changeset

  alias F451.Library.{Author, Reader, Genre}

  schema "books" do
    field :cover, :string
    field :date, :date
    field :file, :string
    field :synopsis, :string
    field :title, :string

    belongs_to :author, Author
    belongs_to :reader, Reader
    belongs_to :genre, Genre

    timestamps()
  end

  @doc false
  def changeset(book, attrs) do
    book
    |> cast(attrs, [:title, :file, :date, :cover, :synopsis])
    |> validate_required([:title, :file, :date, :cover, :synopsis])
    |> foreign_key_constraint(:author_id)
    |> foreign_key_constraint(:reader_id)
    |> foreign_key_constraint(:genre_id)
  end
end
