defmodule F451.Library do
  @moduledoc """
  The Library context.
  """

  import Ecto.Query, warn: false
  alias F451.Repo

  alias F451.Library.Author

  @doc """
  Returns the list of authors.

  ## Examples

      iex> list_authors()
      [%Author{}, ...]

  """
  def list_authors do
    Repo.all(Author)
  end

  @doc """
  Returns the list of books with preload for Country.

  ## Examples

      iex> list_books_with_preload()
      [%Book{%Country{}, ...}, ...]
  """
  def list_authors_with_preload do
    Author
    |> Repo.all()
    |> Repo.preload(:country)
  end

  @doc """
  Gets a single author.

  Raises `Ecto.NoResultsError` if the Author does not exist.

  ## Examples

      iex> get_author!(123)
      %Author{}

      iex> get_author!(456)
      ** (Ecto.NoResultsError)

  """

  def get_author!(id), do: Repo.get!(Author, id)

  @doc """
  Gets a single author with Country preload.

  Raises `Ecto.NoResultsError` if the Author does not exist.

  ## Examples

      iex> get_author!(123)
      %Author{%Country{}}

      iex> get_author!(456)
      ** (Ecto.NoResultsError)

  """
  def get_author_with_preload!(id) do
    Author
    |> Repo.get!(id)
    |> Repo.preload(:country)
    |> Repo.preload(:books)
  end

  @doc """
  Creates a author.

  ## Examples

      iex> create_author(%{field: value})
      {:ok, %Author{}}

      iex> create_author(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_author(attrs \\ %{}) do
    %Author{}
    |> Author.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a author.

  ## Examples

      iex> update_author(author, %{field: new_value})
      {:ok, %Author{}}

      iex> update_author(author, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_author(%Author{} = author, attrs) do
    author
    |> Author.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a author.

  ## Examples

      iex> delete_author(author)
      {:ok, %Author{}}

      iex> delete_author(author)
      {:error, %Ecto.Changeset{}}

  """
  def delete_author(%Author{} = author) do
    Repo.delete(author)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking author changes.

  ## Examples

      iex> change_author(author)
      %Ecto.Changeset{data: %Author{}}

  """
  def change_author(%Author{} = author, attrs \\ %{}) do
    Author.changeset(author, attrs)
  end

  alias F451.Library.Country

  @doc """
  Returns the list of countries.

  ## Examples

      iex> list_countries()
      [%Country{}, ...]

  """
  def list_countries do
    Repo.all(Country)
  end

  @doc """
  Gets a single country.

  Raises `Ecto.NoResultsError` if the Country does not exist.

  ## Examples

      iex> get_country!(123)
      %Country{}

      iex> get_country!(456)
      ** (Ecto.NoResultsError)

  """
  def get_country!(id), do: Repo.get!(Country, id)

  @doc """
  Creates a country.

  ## Examples

      iex> create_country(%{field: value})
      {:ok, %Country{}}

      iex> create_country(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_country(attrs \\ %{}) do
    %Country{}
    |> Country.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a country.

  ## Examples

      iex> update_country(country, %{field: new_value})
      {:ok, %Country{}}

      iex> update_country(country, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_country(%Country{} = country, attrs) do
    country
    |> Country.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a country.

  ## Examples

      iex> delete_country(country)
      {:ok, %Country{}}

      iex> delete_country(country)
      {:error, %Ecto.Changeset{}}

  """
  def delete_country(%Country{} = country) do
    Repo.delete(country)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking country changes.

  ## Examples

      iex> change_country(country)
      %Ecto.Changeset{data: %Country{}}

  """
  def change_country(%Country{} = country, attrs \\ %{}) do
    Country.changeset(country, attrs)
  end

  alias F451.Library.Reader

  @doc """
  Returns the list of readers.

  ## Examples

      iex> list_readers()
      [%Reader{}, ...]

  """
  def list_readers do
    Repo.all(Reader)
  end

  @doc """
  Gets a single reader.

  Raises `Ecto.NoResultsError` if the Reader does not exist.

  ## Examples

      iex> get_reader!(123)
      %Reader{}

      iex> get_reader!(456)
      ** (Ecto.NoResultsError)

  """
  def get_reader!(id), do: Repo.get!(Reader, id)

  @doc """
  Creates a reader.

  ## Examples

      iex> create_reader(%{field: value})
      {:ok, %Reader{}}

      iex> create_reader(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_reader(attrs \\ %{}) do
    %Reader{}
    |> Reader.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a reader.

  ## Examples

      iex> update_reader(reader, %{field: new_value})
      {:ok, %Reader{}}

      iex> update_reader(reader, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_reader(%Reader{} = reader, attrs) do
    reader
    |> Reader.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a reader.

  ## Examples

      iex> delete_reader(reader)
      {:ok, %Reader{}}

      iex> delete_reader(reader)
      {:error, %Ecto.Changeset{}}

  """
  def delete_reader(%Reader{} = reader) do
    Repo.delete(reader)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking reader changes.

  ## Examples

      iex> change_reader(reader)
      %Ecto.Changeset{data: %Reader{}}

  """
  def change_reader(%Reader{} = reader, attrs \\ %{}) do
    Reader.changeset(reader, attrs)
  end

  alias F451.Library.Genre

  @doc """
  Returns the list of genres.

  ## Examples

      iex> list_genres()
      [%Genre{}, ...]

  """
  def list_genres do
    Repo.all(Genre)
  end

  @doc """
  Gets a single genre.

  Raises `Ecto.NoResultsError` if the Genre does not exist.

  ## Examples

      iex> get_genre!(123)
      %Genre{}

      iex> get_genre!(456)
      ** (Ecto.NoResultsError)

  """
  def get_genre!(id), do: Repo.get!(Genre, id)

  @doc """
  Creates a genre.

  ## Examples

      iex> create_genre(%{field: value})
      {:ok, %Genre{}}

      iex> create_genre(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_genre(attrs \\ %{}) do
    %Genre{}
    |> Genre.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a genre.

  ## Examples

      iex> update_genre(genre, %{field: new_value})
      {:ok, %Genre{}}

      iex> update_genre(genre, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_genre(%Genre{} = genre, attrs) do
    genre
    |> Genre.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a genre.

  ## Examples

      iex> delete_genre(genre)
      {:ok, %Genre{}}

      iex> delete_genre(genre)
      {:error, %Ecto.Changeset{}}

  """
  def delete_genre(%Genre{} = genre) do
    Repo.delete(genre)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking genre changes.

  ## Examples

      iex> change_genre(genre)
      %Ecto.Changeset{data: %Genre{}}

  """
  def change_genre(%Genre{} = genre, attrs \\ %{}) do
    Genre.changeset(genre, attrs)
  end

  alias F451.Library.Book

  @doc """
  Returns the list of books.

  ## Examples

      iex> list_books()
      [%Book{}, ...]

  """
  def list_books do
    Repo.all(Book)
  end

  @doc """
  Returns the list of books with preload for Genre, Author and Reader.

  ## Examples

      iex> list_books_with_preload()
      [%Book{%Genre{}, %Author{}, %Reader{}, ...}, ...]
  """
  def list_books_with_preload do
    Book
    |> Repo.all()
    |> Repo.preload(:genre)
    |> Repo.preload(author: :country)
    |> Repo.preload(:reader)
  end

  @doc """
  Gets a single book.

  Raises `Ecto.NoResultsError` if the Book does not exist.

  ## Examples

      iex> get_book!(123)
      %Book{}

      iex> get_book!(456)
      ** (Ecto.NoResultsError)

  """
  def get_book!(id), do: Repo.get!(Book, id)

  @doc """
  Gets a single book with the complete preload (:genre, :reader and [author: :country]).

  Raises `Ecto.NoResultsError` if the Book does not exist.

  ## Examples

      iex> get_book_with_preload!(123)
      %Book{%Genre{}, %Reader{}, %Author{%Country{}}}

      iex> get_book!(456)
      ** (Ecto.NoResultsError)
  """
  def get_book_with_preload!(id) do
    Book
    |> Repo.get!(id)
    |> Repo.preload(:genre)
    |> Repo.preload(author: :country)
    |> Repo.preload(:reader)
  end

  @doc """
  Creates a book.

  ## Examples

      iex> create_book(%{field: value})
      {:ok, %Book{}}

      iex> create_book(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_book(attrs \\ %{}) do
    %Book{}
    |> Book.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a book.

  ## Examples

      iex> update_book(book, %{field: new_value})
      {:ok, %Book{}}

      iex> update_book(book, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_book(%Book{} = book, attrs) do
    book
    |> Book.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a book.

  ## Examples

      iex> delete_book(book)
      {:ok, %Book{}}

      iex> delete_book(book)
      {:error, %Ecto.Changeset{}}

  """
  def delete_book(%Book{} = book) do
    Repo.delete(book)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking book changes.

  ## Examples

      iex> change_book(book)
      %Ecto.Changeset{data: %Book{}}

  """
  def change_book(%Book{} = book, attrs \\ %{}) do
    Book.changeset(book, attrs)
  end
end
