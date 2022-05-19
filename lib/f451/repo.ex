defmodule F451.Repo do
  use Ecto.Repo,
    otp_app: :f451,
    adapter: Ecto.Adapters.Postgres
end
