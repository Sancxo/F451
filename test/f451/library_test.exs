defmodule F451.LibraryTest do
  use F451.DataCase

  alias F451.Library

  describe "authors" do
    alias F451.Library.Author

    import F451.LibraryFixtures

    @invalid_attrs %{avatar: nil, biography: nil, birthdate: nil, country: nil, death_date: nil, first_name: nil, last_name: nil}

    test "list_authors/0 returns all authors" do
      author = author_fixture()
      assert Library.list_authors() == [author]
    end

    test "get_author!/1 returns the author with given id" do
      author = author_fixture()
      assert Library.get_author!(author.id) == author
    end

    test "create_author/1 with valid data creates a author" do
      valid_attrs = %{avatar: "some avatar", biography: "some biography", birthdate: ~D[2022-05-18], country: "some country", death_date: ~D[2022-05-18], first_name: "some first_name", last_name: "some last_name"}

      assert {:ok, %Author{} = author} = Library.create_author(valid_attrs)
      assert author.avatar == "some avatar"
      assert author.biography == "some biography"
      assert author.birthdate == ~D[2022-05-18]
      assert author.country == "some country"
      assert author.death_date == ~D[2022-05-18]
      assert author.first_name == "some first_name"
      assert author.last_name == "some last_name"
    end

    test "create_author/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Library.create_author(@invalid_attrs)
    end

    test "update_author/2 with valid data updates the author" do
      author = author_fixture()
      update_attrs = %{avatar: "some updated avatar", biography: "some updated biography", birthdate: ~D[2022-05-19], country: "some updated country", death_date: ~D[2022-05-19], first_name: "some updated first_name", last_name: "some updated last_name"}

      assert {:ok, %Author{} = author} = Library.update_author(author, update_attrs)
      assert author.avatar == "some updated avatar"
      assert author.biography == "some updated biography"
      assert author.birthdate == ~D[2022-05-19]
      assert author.country == "some updated country"
      assert author.death_date == ~D[2022-05-19]
      assert author.first_name == "some updated first_name"
      assert author.last_name == "some updated last_name"
    end

    test "update_author/2 with invalid data returns error changeset" do
      author = author_fixture()
      assert {:error, %Ecto.Changeset{}} = Library.update_author(author, @invalid_attrs)
      assert author == Library.get_author!(author.id)
    end

    test "delete_author/1 deletes the author" do
      author = author_fixture()
      assert {:ok, %Author{}} = Library.delete_author(author)
      assert_raise Ecto.NoResultsError, fn -> Library.get_author!(author.id) end
    end

    test "change_author/1 returns a author changeset" do
      author = author_fixture()
      assert %Ecto.Changeset{} = Library.change_author(author)
    end
  end

  describe "countries" do
    alias F451.Library.Country

    import F451.LibraryFixtures

    @invalid_attrs %{name: nil}

    test "list_countries/0 returns all countries" do
      country = country_fixture()
      assert Library.list_countries() == [country]
    end

    test "get_country!/1 returns the country with given id" do
      country = country_fixture()
      assert Library.get_country!(country.id) == country
    end

    test "create_country/1 with valid data creates a country" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Country{} = country} = Library.create_country(valid_attrs)
      assert country.name == "some name"
    end

    test "create_country/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Library.create_country(@invalid_attrs)
    end

    test "update_country/2 with valid data updates the country" do
      country = country_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Country{} = country} = Library.update_country(country, update_attrs)
      assert country.name == "some updated name"
    end

    test "update_country/2 with invalid data returns error changeset" do
      country = country_fixture()
      assert {:error, %Ecto.Changeset{}} = Library.update_country(country, @invalid_attrs)
      assert country == Library.get_country!(country.id)
    end

    test "delete_country/1 deletes the country" do
      country = country_fixture()
      assert {:ok, %Country{}} = Library.delete_country(country)
      assert_raise Ecto.NoResultsError, fn -> Library.get_country!(country.id) end
    end

    test "change_country/1 returns a country changeset" do
      country = country_fixture()
      assert %Ecto.Changeset{} = Library.change_country(country)
    end
  end
end
