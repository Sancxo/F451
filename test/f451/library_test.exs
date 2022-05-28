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

  describe "readers" do
    alias F451.Library.Reader

    import F451.LibraryFixtures

    @invalid_attrs %{avatar: nil, first_name: nil, last_name: nil, pseudo: nil}

    test "list_readers/0 returns all readers" do
      reader = reader_fixture()
      assert Library.list_readers() == [reader]
    end

    test "get_reader!/1 returns the reader with given id" do
      reader = reader_fixture()
      assert Library.get_reader!(reader.id) == reader
    end

    test "create_reader/1 with valid data creates a reader" do
      valid_attrs = %{avatar: "some avatar", first_name: "some first_name", last_name: "some last_name", pseudo: "some pseudo"}

      assert {:ok, %Reader{} = reader} = Library.create_reader(valid_attrs)
      assert reader.avatar == "some avatar"
      assert reader.first_name == "some first_name"
      assert reader.last_name == "some last_name"
      assert reader.pseudo == "some pseudo"
    end

    test "create_reader/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Library.create_reader(@invalid_attrs)
    end

    test "update_reader/2 with valid data updates the reader" do
      reader = reader_fixture()
      update_attrs = %{avatar: "some updated avatar", first_name: "some updated first_name", last_name: "some updated last_name", pseudo: "some updated pseudo"}

      assert {:ok, %Reader{} = reader} = Library.update_reader(reader, update_attrs)
      assert reader.avatar == "some updated avatar"
      assert reader.first_name == "some updated first_name"
      assert reader.last_name == "some updated last_name"
      assert reader.pseudo == "some updated pseudo"
    end

    test "update_reader/2 with invalid data returns error changeset" do
      reader = reader_fixture()
      assert {:error, %Ecto.Changeset{}} = Library.update_reader(reader, @invalid_attrs)
      assert reader == Library.get_reader!(reader.id)
    end

    test "delete_reader/1 deletes the reader" do
      reader = reader_fixture()
      assert {:ok, %Reader{}} = Library.delete_reader(reader)
      assert_raise Ecto.NoResultsError, fn -> Library.get_reader!(reader.id) end
    end

    test "change_reader/1 returns a reader changeset" do
      reader = reader_fixture()
      assert %Ecto.Changeset{} = Library.change_reader(reader)
    end
  end

  describe "genres" do
    alias F451.Library.Genre

    import F451.LibraryFixtures

    @invalid_attrs %{name: nil}

    test "list_genres/0 returns all genres" do
      genre = genre_fixture()
      assert Library.list_genres() == [genre]
    end

    test "get_genre!/1 returns the genre with given id" do
      genre = genre_fixture()
      assert Library.get_genre!(genre.id) == genre
    end

    test "create_genre/1 with valid data creates a genre" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Genre{} = genre} = Library.create_genre(valid_attrs)
      assert genre.name == "some name"
    end

    test "create_genre/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Library.create_genre(@invalid_attrs)
    end

    test "update_genre/2 with valid data updates the genre" do
      genre = genre_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Genre{} = genre} = Library.update_genre(genre, update_attrs)
      assert genre.name == "some updated name"
    end

    test "update_genre/2 with invalid data returns error changeset" do
      genre = genre_fixture()
      assert {:error, %Ecto.Changeset{}} = Library.update_genre(genre, @invalid_attrs)
      assert genre == Library.get_genre!(genre.id)
    end

    test "delete_genre/1 deletes the genre" do
      genre = genre_fixture()
      assert {:ok, %Genre{}} = Library.delete_genre(genre)
      assert_raise Ecto.NoResultsError, fn -> Library.get_genre!(genre.id) end
    end

    test "change_genre/1 returns a genre changeset" do
      genre = genre_fixture()
      assert %Ecto.Changeset{} = Library.change_genre(genre)
    end
  end

  describe "books" do
    alias F451.Library.Book

    import F451.LibraryFixtures

    @invalid_attrs %{cover: nil, date: nil, file: nil, synopsis: nil, title: nil}

    test "list_books/0 returns all books" do
      book = book_fixture()
      assert Library.list_books() == [book]
    end

    test "get_book!/1 returns the book with given id" do
      book = book_fixture()
      assert Library.get_book!(book.id) == book
    end

    test "create_book/1 with valid data creates a book" do
      valid_attrs = %{cover: "some cover", date: ~D[2022-05-27], file: "some file", synopsis: "some synopsis", title: "some title"}

      assert {:ok, %Book{} = book} = Library.create_book(valid_attrs)
      assert book.cover == "some cover"
      assert book.date == ~D[2022-05-27]
      assert book.file == "some file"
      assert book.synopsis == "some synopsis"
      assert book.title == "some title"
    end

    test "create_book/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Library.create_book(@invalid_attrs)
    end

    test "update_book/2 with valid data updates the book" do
      book = book_fixture()
      update_attrs = %{cover: "some updated cover", date: ~D[2022-05-28], file: "some updated file", synopsis: "some updated synopsis", title: "some updated title"}

      assert {:ok, %Book{} = book} = Library.update_book(book, update_attrs)
      assert book.cover == "some updated cover"
      assert book.date == ~D[2022-05-28]
      assert book.file == "some updated file"
      assert book.synopsis == "some updated synopsis"
      assert book.title == "some updated title"
    end

    test "update_book/2 with invalid data returns error changeset" do
      book = book_fixture()
      assert {:error, %Ecto.Changeset{}} = Library.update_book(book, @invalid_attrs)
      assert book == Library.get_book!(book.id)
    end

    test "delete_book/1 deletes the book" do
      book = book_fixture()
      assert {:ok, %Book{}} = Library.delete_book(book)
      assert_raise Ecto.NoResultsError, fn -> Library.get_book!(book.id) end
    end

    test "change_book/1 returns a book changeset" do
      book = book_fixture()
      assert %Ecto.Changeset{} = Library.change_book(book)
    end
  end
end
