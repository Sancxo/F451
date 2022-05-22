defmodule F451.Library.Author do
  use Ecto.Schema
  import Ecto.Changeset

  schema "authors" do
    field :avatar, :string
    field :biography, :string
    field :birthdate, :date
    field :death_date, :date
    field :first_name, :string
    field :last_name, :string

    belongs_to :country, F451.Library.Country

    timestamps()
  end

  @doc false
  def changeset(author, attrs) do
    author
    |> cast(attrs, [
      :last_name,
      :first_name,
      :country_id,
      :birthdate,
      :death_date,
      :avatar,
      :biography
    ])
    |> validate_required([:last_name, :birthdate, :country_id])
  end
end
