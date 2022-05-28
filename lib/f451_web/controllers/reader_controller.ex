defmodule F451Web.ReaderController do
  use F451Web, :controller

  alias F451.Library
  alias F451.Library.Reader

  def index(conn, _params) do
    readers = Library.list_readers()
    render(conn, "index.html", readers: readers)
  end

  def new(conn, _params) do
    changeset = Library.change_reader(%Reader{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"reader" => reader_params}) do
    case Library.create_reader(reader_params) do
      {:ok, reader} ->
        conn
        |> put_flash(:info, "Reader created successfully.")
        |> redirect(to: Routes.reader_path(conn, :show, reader))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    reader = Library.get_reader!(id)
    render(conn, "show.html", reader: reader)
  end

  def edit(conn, %{"id" => id}) do
    reader = Library.get_reader!(id)
    changeset = Library.change_reader(reader)
    render(conn, "edit.html", reader: reader, changeset: changeset)
  end

  def update(conn, %{"id" => id, "reader" => reader_params}) do
    reader = Library.get_reader!(id)

    case Library.update_reader(reader, reader_params) do
      {:ok, reader} ->
        conn
        |> put_flash(:info, "Reader updated successfully.")
        |> redirect(to: Routes.reader_path(conn, :show, reader))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", reader: reader, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    reader = Library.get_reader!(id)
    {:ok, _reader} = Library.delete_reader(reader)

    conn
    |> put_flash(:info, "Reader deleted successfully.")
    |> redirect(to: Routes.reader_path(conn, :index))
  end
end
