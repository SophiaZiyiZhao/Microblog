defmodule Microblog.Tofollow.Follow do
  use Ecto.Schema
  import Ecto.Changeset
  alias Microblog.Tofollow.Follow


  schema "followers" do
    belongs_to :following, User, foreign_key: :following_id
    belongs_to :follower, User, foreign_key: :follower_id 
    timestamps()
  end

  @doc false
  def changeset(%Follow{} = follow, attrs) do
    follow
    |> cast(attrs, [:follower_id, :following_id])
    |> validate_required([:follower_id, :following_id])
  end
end
