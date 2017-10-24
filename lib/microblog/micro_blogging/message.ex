defmodule Microblog.Micro_blogging.Message do
  use Ecto.Schema
  import Ecto.Changeset
  alias Microblog.Micro_blogging.Message
  alias Microblog.Accounts.User

  schema "messages" do
    field :content, :string

    belongs_to :user, Microblog.Accounts.User
    timestamps()
  end

  @doc false
  def changeset(%Message{} = message, attrs) do
    message
    |> cast(attrs, [:user_id, :content])
    |> validate_required([:user_id, :content])
  end
end
