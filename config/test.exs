import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :f451, F451.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "f451_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :f451, F451Web.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "kD68mRd0mglZB+8fEaDBji6kS7RyPLl+HOAT6Wqa/iLcyUih6LO+h9klsrPt5sZj",
  server: false

# In test we don't send emails.
config :f451, F451.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
