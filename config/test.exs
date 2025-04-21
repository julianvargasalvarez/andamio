import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :andamio, Andamio.Repo,
  username: "myuser",
  password: "mypassword",
  hostname: "localhost",
  database: "andamio_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: System.schedulers_online() * 2

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :andamio, AndamioWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "E8bkGwktcPS4pGNsNM81l04ySn+xDo/JKY8pqsoUVWTUa1N/RgrrQ/x5ExWEfaIi",
  server: true

# In test we don't send emails
config :andamio, Andamio.Mailer, adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters
config :swoosh, :api_client, false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

# Enable helpful, but potentially expensive runtime checks
config :phoenix_live_view,
  enable_expensive_runtime_checks: true

config :wallaby, otp_app: :andamio

config :wallaby,
  driver: Wallaby.Selenium,
  selenium: [
    remote_url: "http://localhost:4444/",
    capabilities: %{
      acceptInsecureCerts: false,
      browserName: "firefox",
      browserVersion: "137.0.1",
      "container:hostname": "6df7f1139bb9",
      "moz:accessibilityChecks": false,
      "moz:buildID": "20250407111027",
      "moz:geckodriverVersion": "0.36.0",
      "moz:headless": false,
      "moz:platformVersion": "5.15.167.4-microsoft-standard-WSL2",
      "moz:processID": 162,
      "moz:profile": "\u002ftmp\u002frust_mozprofileIVfSHC",
      "moz:shutdownTimeout": 60000,
      "moz:webdriverClick": true,
      "moz:windowless": false,
      pageLoadStrategy: "normal",
      platformName: "linux",
      proxy: %{},
      "se:bidiEnabled": false,
      "se:cdpEnabled": false,
      "se:containerName": "6df7f1139bb9",
      "se:noVncPort": 7900,
      "se:vnc": "ws:\u002f\u002f172.17.0.2:4444\u002fsession\u002fc202844a-5d4a-4646-8876-b523e0b19bc8\u002fse\u002fvnc",
      "se:vncEnabled": true,
      "se:vncLocalAddress": "ws:\u002f\u002f172.17.0.2:7900",
      setWindowRect: true,
      strictFileInteractability: false,
      timeouts: %{
        implicit: 0,
        pageLoad: 300000,
        script: 30000
      },
      unhandledPromptBehavior: "dismiss and notify",
      userAgent: "Mozilla\u002f5.0 (X11; Linux x86_64; rv:137.0) Gecko\u002f20100101 Firefox\u002f137.0"
    }
  ]
