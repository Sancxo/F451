defmodule F451.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      F451.Repo,
      # Start the Telemetry supervisor
      F451Web.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: F451.PubSub},
      # Start the Endpoint (http/https)
      F451Web.Endpoint
      # Start a worker by calling: F451.Worker.start_link(arg)
      # {F451.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: F451.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    F451Web.Endpoint.config_change(changed, removed)
    :ok
  end
end
