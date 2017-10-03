defmodule Microblog.Microblog.Message do
  use Ecto.Schema
  import Ecto.Changeset
  alias Microblog.Microblog.Message


  schema "messages" do
    field :content, :string
 #   belongs_to :user, Microblog.Accounts.User
    timestamps()
  end

  @doc false
  def changeset(%Message{} = message, attrs) do
    message
    |> cast(attrs, [:content])
    |> validate_required([:content])
  end
end
