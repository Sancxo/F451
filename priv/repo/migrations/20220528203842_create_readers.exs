defmodule F451.Repo.Migrations.CreateReaders do
  use Ecto.Migration

  def change do
    create table(:readers) do
      add :first_name, :string
      add :last_name, :string
      add :pseudo, :string
      add :avatar, :string

      timestamps()
    end
  end
end
