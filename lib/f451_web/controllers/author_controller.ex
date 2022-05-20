defmodule F451Web.AuthorController do
  use F451Web, :controller

  alias F451.Library
  alias F451.Library.Author

  def index(conn, _params) do
    authors = Library.list_authors_with_preload() |> IO.inspect()

    render(conn, "index.html", authors: authors)
  end

  def new(conn, _params) do
    countries = Library.list_countries()
    changeset = Library.change_author(%Author{})

    render(conn, "new.html", changeset: changeset, countries: countries)
  end

  def create(conn, %{"author" => author_params}) do
    countries = Library.list_countries()

    case Library.create_author(author_params) do
      {:ok, author} ->
        conn
        |> put_flash(:info, "Author created successfully.")
        |> redirect(to: Routes.author_path(conn, :show, author))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset, countries: countries)
    end
  end

  def show(conn, %{"id" => id}) do
    author = Library.get_author_with_preload!(id)
    render(conn, "show.html", author: author)
  end

  def edit(conn, %{"id" => id}) do
    author = Library.get_author_with_preload!(id)
    changeset = Library.change_author(author)

    render(conn, "edit.html", author: author, changeset: changeset)
  end

  def update(conn, %{"id" => id, "author" => author_params}) do
    author = Library.get_author_with_preload!(id)

    case Library.update_author(author, author_params) do
      {:ok, author} ->
        conn
        |> put_flash(:info, "Author updated successfully.")
        |> redirect(to: Routes.author_path(conn, :show, author))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", author: author, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    author = Library.get_author!(id)
    {:ok, _author} = Library.delete_author(author)

    conn
    |> put_flash(:info, "Author deleted successfully.")
    |> redirect(to: Routes.author_path(conn, :index))
  end
end
