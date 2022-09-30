defmodule Temp.Repo do
  use Ecto.Repo,
    otp_app: :temp,
    adapter: Ecto.Adapters.Postgres
end
