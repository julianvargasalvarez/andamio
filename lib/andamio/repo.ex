defmodule Andamio.Repo do
  use Ecto.Repo,
    otp_app: :andamio,
    adapter: Ecto.Adapters.Postgres
end
