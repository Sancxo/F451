defmodule F451.LibraryFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `F451.Library` context.
  """

  @doc """
  Generate a author.
  """
  def author_fixture(attrs \\ %{}) do
    {:ok, author} =
      attrs
      |> Enum.into(%{
        avatar: "some avatar",
        biography: "some biography",
        birthdate: ~D[2022-05-18],
        country: "some country",
        death_date: ~D[2022-05-18],
        first_name: "some first_name",
        last_name: "some last_name"
      })
      |> F451.Library.create_author()

    author
  end

  @doc """
  Generate a country.
  """
  def country_fixture(attrs \\ %{}) do
    {:ok, country} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> F451.Library.create_country()

    country
  end

  @doc """
  Generate a reader.
  """
  def reader_fixture(attrs \\ %{}) do
    {:ok, reader} =
      attrs
      |> Enum.into(%{
        avatar: "some avatar",
        first_name: "some first_name",
        last_name: "some last_name",
        pseudo: "some pseudo"
      })
      |> F451.Library.create_reader()

    reader
  end
end
