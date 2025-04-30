defmodule Andamio.Repo.Migrations.CreateBusinesses do
  use Ecto.Migration

  def change do
    create table(:businesses) do
      add :name, :string, null: false

      timestamps(type: :utc_datetime)
    end
  end
end
