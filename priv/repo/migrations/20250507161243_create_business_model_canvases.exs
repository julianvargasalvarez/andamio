defmodule Andamio.Repo.Migrations.CreateBusinessModelCanvases do
  use Ecto.Migration

  def change do
    create table(:business_model_canvases) do
      add :description, :text
      add :business_id, references(:businesses, on_delete: :delete_all)

      timestamps(type: :utc_datetime)
    end

    create index(:business_model_canvases, [:business_id])
  end
end
