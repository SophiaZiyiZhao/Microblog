defmodule MicroblogWeb.FollowController do
  use MicroblogWeb, :controller

  alias Microblog.Tofollow
  alias Microblog.Tofollow.Follow

  def index(conn, _params) do
    followers = Tofollow.list_followers()
    render(conn, "index.html", followers: followers)
  end

  def new(conn, _params) do
    changeset = Tofollow.change_follow(%Follow{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"follow" => follow_params}) do
    case Tofollow.create_follow(follow_params) do
      {:ok, follow} ->
        IO.puts(follow_params["following_id"])
        following = Tofollow.get_user!(follow_params["following_id"])
        conn
        |> put_flash(:info, "Follow created successfully.")
        |> redirect(to: follow_path(conn, :show, follow))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    follow = Tofollow.get_follow!(id)
    render(conn, "show.html", follow: follow)
  end

  def edit(conn, %{"id" => id}) do
    follow = Tofollow.get_follow!(id)
    changeset = Tofollow.change_follow(follow)
    render(conn, "edit.html", follow: follow, changeset: changeset)
  end

  def update(conn, %{"id" => id, "follow" => follow_params}) do
    follow = Tofollow.get_follow!(id)

    case Tofollow.update_follow(follow, follow_params) do
      {:ok, follow} ->
        conn
        |> put_flash(:info, "Follow updated successfully.")
        |> redirect(to: follow_path(conn, :show, follow))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", follow: follow, changeset: changeset)
    end
   end
end
