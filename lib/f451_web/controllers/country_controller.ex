defmodule F451Web.CountryController do
  use F451Web, :controller

  alias F451.Library
  alias F451.Library.Country

  def index(conn, _params) do
    countries = Library.list_countries()
    render(conn, "index.html", countries: countries)
  end

  def new(conn, _params) do
    changeset = Library.change_country(%Country{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"country" => country_params}) do
    case Library.create_country(country_params) do
      {:ok, country} ->
        conn
        |> put_flash(:info, "Country created successfully.")
        |> redirect(to: Routes.country_path(conn, :show, country))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    country = Library.get_country!(id)
    render(conn, "show.html", country: country)
  end

  def edit(conn, %{"id" => id}) do
    country = Library.get_country!(id)
    changeset = Library.change_country(country)
    render(conn, "edit.html", country: country, changeset: changeset)
  end

  def update(conn, %{"id" => id, "country" => country_params}) do
    country = Library.get_country!(id)

    case Library.update_country(country, country_params) do
      {:ok, country} ->
        conn
        |> put_flash(:info, "Country updated successfully.")
        |> redirect(to: Routes.country_path(conn, :show, country))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", country: country, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    country = Library.get_country!(id)
    {:ok, _country} = Library.delete_country(country)

    conn
    |> put_flash(:info, "Country deleted successfully.")
    |> redirect(to: Routes.country_path(conn, :index))
  end
end
