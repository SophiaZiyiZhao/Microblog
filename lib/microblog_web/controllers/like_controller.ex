defmodule MicroblogWeb.LikeController do
  use MicroblogWeb, :controller

  alias Microblog.Micro_blogging
  alias Microblog.Micro_blogging.Like

  action_fallback MicroblogWeb.FallbackController

  def index(conn, %{"message_id" => message_id}) do
    likes = Micro_blogging.list_likes(message_id)
    render(conn, "index.json", likes: likes)
  end

  def create(conn, %{"like" => like_params}) do
    with {:ok, %Like{} = like} <- Micro_blogging.create_like(like_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", like_path(conn, :show, like))
      |> render("show.json", like: like)
    end
  end

  def show(conn, %{"id" => id}) do
    like = Micro_blogging.get_like!(id)
    render(conn, "show.json", like: like)
  end

  def update(conn, %{"id" => id, "like" => like_params}) do
    like = Micro_blogging.get_like!(id)

    with {:ok, %Like{} = like} <- Micro_blogging.update_like(like, like_params) do
      render(conn, "show.json", like: like)
    end
  end

  def delete(conn, %{"id" => id}) do
    like = Micro_blogging.get_like!(id)
    with {:ok, %Like{}} <- Micro_blogging.delete_like(like) do
      send_resp(conn, :no_content, "")
    end
  end
end
