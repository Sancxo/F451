defmodule F451Web.BookController do
  use F451Web, :controller

  alias F451.Library
  alias F451.Library.Book

  def index(conn, _params) do
    books = Library.list_books_with_preload()
    render(conn, "index.html", books: books)
  end

  def new(conn, _params) do
    genres = Library.list_genres()
    authors = Library.list_authors()
    readers = Library.list_readers()

    changeset = Library.change_book(%Book{})

    render(conn, "new.html",
      changeset: changeset,
      genres: genres,
      authors: authors,
      readers: readers
    )
  end

  def create(conn, %{"book" => book_params}) do
    IO.inspect(book_params)

    case Library.create_book(book_params) do
      {:ok, book} ->
        conn
        |> put_flash(:info, "Book created successfully.")
        |> redirect(to: Routes.book_path(conn, :show, book))

      {:error, %Ecto.Changeset{} = changeset} ->
        genres = Library.list_genres()
        authors = Library.list_authors()
        readers = Library.list_readers()

        render(conn, "new.html",
          changeset: changeset,
          genres: genres,
          readers: readers,
          authors: authors
        )
    end
  end

  def show(conn, %{"id" => id}) do
    book = Library.get_book_with_preload!(id)
    render(conn, "show.html", book: book)
  end

  def edit(conn, %{"id" => id}) do
    book = Library.get_book!(id)
    genres = Library.list_genres()
    authors = Library.list_authors()
    readers = Library.list_readers()
    changeset = Library.change_book(book)

    render(conn, "edit.html",
      book: book,
      changeset: changeset,
      genres: genres,
      authors: authors,
      readers: readers
    )
  end

  def update(conn, %{"id" => id, "book" => book_params}) do
    book = Library.get_book!(id)

    case Library.update_book(book, book_params) do
      {:ok, book} ->
        conn
        |> put_flash(:info, "Book updated successfully.")
        |> redirect(to: Routes.book_path(conn, :show, book))

      {:error, %Ecto.Changeset{} = changeset} ->
        genres = Library.list_genres()
        authors = Library.list_authors()
        readers = Library.list_readers()

        render(conn, "edit.html",
          book: book,
          changeset: changeset,
          genres: genres,
          readers: readers,
          authors: authors
        )
    end
  end

  def delete(conn, %{"id" => id}) do
    book = Library.get_book!(id)
    {:ok, _book} = Library.delete_book(book)

    conn
    |> put_flash(:info, "Book deleted successfully.")
    |> redirect(to: Routes.book_path(conn, :index))
  end
end
