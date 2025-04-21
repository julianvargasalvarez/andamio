defmodule AndamioWeb.PageController do
  use AndamioWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    IO.puts("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")
    render(conn, :home, layout: false)
  end
end
