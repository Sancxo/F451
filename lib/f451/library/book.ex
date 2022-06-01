defmodule F451.Library.Book do
  use Ecto.Schema
  import Ecto.Changeset

  alias F451.{BookCovers, BookAudioFiles}
  alias F451.Library.{Author, Reader, Genre}

  schema "books" do
    field :cover, BookCovers.Type
    field :date, :date
    field :file, BookAudioFiles.Type
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
    |> cast(attrs, [:title, :file, :date, :cover, :synopsis, :genre_id, :reader_id, :author_id])
    |> validate_required([:title, :genre_id, :author_id])
    |> foreign_key_constraint(:author_id)
    |> foreign_key_constraint(:reader_id)
    |> foreign_key_constraint(:genre_id)
  end
end
