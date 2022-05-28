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

  def get_author_with_preload!(id) do
    Author
    |> Repo.get!(id)
    |> Repo.preload(:country)
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

  def list_countries_id do
    Country
    |> select([c], c.id)
    |> Repo.all()
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
end
