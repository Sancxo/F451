defmodule F451Web.PageController do
  use F451Web, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
