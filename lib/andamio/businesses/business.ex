defmodule Andamio.Businesses.Business do
  use Ecto.Schema
  import Ecto.Changeset

  schema "businesses" do
    field :name, :string

    timestamps(type: :utc_datetime)

    has_one(:business_model_canvas, Andamio.Businesses.BusinessModelCanvas, on_delete: :delete_all)
  end

  @doc false
  def changeset(business, attrs) do
    business
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
