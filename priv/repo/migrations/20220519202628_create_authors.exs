defmodule F451.Repo.Migrations.CreateAuthors do
  use Ecto.Migration

  def change do
    create table(:authors) do
      add :last_name, :string
      add :first_name, :string
      add :country, :string
      add :birthdate, :date
      add :death_date, :date
      add :avatar, :string
      add :biography, :text

      timestamps()
    end
  end
end
