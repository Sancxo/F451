defmodule F451.Repo.Migrations.AlterAuthorsCountryId do
  use Ecto.Migration

  def change do
    alter table(:authors) do
      remove :country
      add :country_id, references(:countries)
    end
  end
end
