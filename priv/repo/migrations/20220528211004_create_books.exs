defmodule F451.Repo.Migrations.CreateBooks do
  use Ecto.Migration

  def change do
    create table(:books) do
      add :title, :string
      add :file, :string
      add :date, :date
      add :cover, :string
      add :synopsis, :text
      add :author_id, references(:authors, on_delete: :nothing)
      add :reader_id, references(:readers, on_delete: :nothing)
      add :genre_id, references(:genres, on_delete: :nothing)

      timestamps()
    end

    create index(:books, [:author_id])
    create index(:books, [:reader_id])
    create index(:books, [:genre_id])
  end
end
